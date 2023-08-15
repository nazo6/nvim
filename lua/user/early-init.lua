if require("user.utils").is_win then
  -- HACK: workaraound for https://github.com/neovim/neovim/issues/17762
  os.execute = function(cmd)
    vim.fn.system(cmd)
    return vim.v.shell_error
  end
  local spawn_orig = vim.loop.spawn

  -- HACK: this avoids the issue with vim.loop.spawn on windows
  vim.loop.spawn = function(orig_path, options, on_exit)
    local path = orig_path
    local handle_chk, _ = spawn_orig(path, {}, function() end)
    if not handle_chk then
      path = orig_path .. ".cmd"
    end

    local handle, pid = spawn_orig(path, options, on_exit)

    return handle, pid
  end

  -- HACK: ignore annoying EPERM error on windows
  do
    local function stop(handle)
      local _, stop_err = handle:stop()
      assert(not stop_err, stop_err)
      local is_closing, close_err = handle:is_closing()
      assert(not close_err, close_err)
      if not is_closing then
        handle:close()
      end
    end
    local function filepath_join(...)
      return table.concat({ ... }, "/")
    end
    require("vim._watch").watch = function(path, opts, callback)
      vim.validate {
        path = { path, "string", false },
        opts = { opts, "table", true },
        callback = { callback, "function", false },
      }

      vim.notify(path)

      path = vim.fs.normalize(path)
      local uvflags = opts and opts.uvflags or {}
      local handle, new_err = vim.uv.new_fs_event()
      assert(not new_err, new_err)
      local _, start_err = handle:start(path, uvflags, function(err, filename, events)
        assert(not err, err)
        local fullpath = path
        if filename then
          filename = filename:gsub("\\", "/")
          fullpath = filepath_join(fullpath, filename)
        end
        local change_type = events.change and require("vim._watch").FileChangeType.Changed or 0
        if events.rename then
          local _, staterr, staterrname = vim.uv.fs_stat(fullpath)
          if staterrname == "ENOENT" then
            change_type = require("vim._watch").FileChangeType.Deleted
          elseif staterrname == "EPERM" then
            return
          else
            assert(not staterr, staterr)
            change_type = require("vim._watch").FileChangeType.Created
          end
        end
        callback(fullpath, change_type)
      end)
      assert(not start_err, start_err)
      return function()
        stop(handle)
      end
    end
  end
end

vim.g.mapleader = " "

--- speeded up map function
---@param mode string|table
---
---@param lhs string
---@param rhs string|function
---
---@param opts table|nil
function map(mode, lhs, rhs, opts)
  opts = opts or {}

  mode = type(mode) == "string" and { mode } or mode

  if opts.expr and opts.replace_keycodes ~= false then
    opts.replace_keycodes = true
  end

  if opts.remap == nil then
    -- default remap value is false
    opts.noremap = true
  else
    -- remaps behavior is opposite of noremap option.
    opts.noremap = not opts.remap
    opts.remap = nil
  end

  if type(rhs) == "function" then
    opts.callback = rhs
    rhs = ""
  end

  if opts.buffer then
    local bufnr = opts.buffer == true and 0 or opts.buffer
    opts.buffer = nil
    for _, m in ipairs(mode) do
      vim.api.nvim_buf_set_keymap(bufnr, m, lhs, rhs, opts)
    end
  else
    opts.buffer = nil
    for _, m in ipairs(mode) do
      vim.api.nvim_set_keymap(m, lhs, rhs, opts)
    end
  end
end
