vim.g.mapleader = " "
vim.g.maplocalleader = ","

if vim.fn.has "win32" == 1 then
  -- HACK: For some reason, the default `vim.ui.open` function does not work correctly on my environment.
  -- Prepending `cmd /c` to default cmd for `vim.ui.open` makes it work.
  local o = vim.ui.open
  vim.ui.open = function(...)
    local args = { ... }
    if args[2] == nil or (type(args[2]) == "table" and args[2].cmd == nil) then
      if args[2] == nil then
        args[2] = {}
      end
      args[2].cmd = { "cmd", "/c", "rundll32", "url.dll,FileProtocolHandler" }
    end
    o(unpack(args))
  end
end

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
