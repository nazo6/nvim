local M = {}

M.os = vim.loop.os_uname().sysname

M.is_win = M.os == "Windows_NT"

local host_cached = nil
M.get_host = function()
  if vim.fn.has "wsl" == 1 then
    if host_cached == nil then
      host_cached = vim.fn.system "cat /etc/resolv.conf | grep nameserver | cut -d ' ' -f 2"
      host_cached = host_cached:gsub("^%s*(.-)%s*$", "%1")
    end
    return host_cached
  end

  return "localhost"
end

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

M.script_path = function()
  local str = debug.getinfo(2, "S").source:sub(2)
  if M.is_win then
    str = str:gsub("/", "\\")
  end
  local separator = M.is_win and "\\" or "/"
  return str:match("(.*" .. separator .. ")")
end

return M
