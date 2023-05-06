if require("user.utils").is_win then
  -- workaraound for https://github.com/neovim/neovim/issues/17762
  os.execute = function(cmd)
    vim.fn.system(cmd)
    return vim.v.shell_error
  end
  local spawn_orig = vim.loop.spawn
  vim.loop.spawn = function(orig_path, options, on_exit)
    local path = orig_path
    local handle_chk, _ = spawn_orig(path, {}, function() end)
    if not handle_chk then
      path = orig_path .. ".cmd"
    end

    local handle, pid = spawn_orig(path, options, on_exit)

    return handle, pid
  end
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

vim.g.mapleader = " "

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
