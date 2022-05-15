local M = {}

--- @vararg function|nil
M.merge_functions = function(...)
  local fns = { ... }
  return function(...)
    for _, fn in ipairs(fns) do
      if fn ~= nil then
        fn(...)
      end
    end
  end
end

M.os = vim.loop.os_uname().sysname

M.is_win = M.os == "Windows_NT"

M.send_key = function(key)
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "")
end

return M
