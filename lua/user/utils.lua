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

M.send_key_nomap = function(key)
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n")
end

--- A helper function to wrap a module function to require a plugin before running
--- From: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/utils/init.lua
-- @param plugin the plugin string to call `require("lazy").load` with
-- @param module the system module where the functions live (e.g. `vim.ui`)
-- @param func_names a string or a list like table of strings for functions to wrap in the given module (e.g. `{ "ui", "select }`)
M.load_plugin_with_func = function(plugin, module, func_names)
  if type(func_names) == "string" then
    func_names = { func_names }
  end
  for _, func in ipairs(func_names) do
    local old_func = module[func]
    module[func] = function(...)
      module[func] = old_func
      require("lazy").load { plugins = { plugin } }
      module[func](...)
    end
  end
end

return M
