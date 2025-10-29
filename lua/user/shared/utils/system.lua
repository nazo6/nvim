local M = {}

M.os = vim.loop.os_uname().sysname

M.is_win = M.os == "Windows_NT"
M.is_msys2 = M.is_win and vim.env.MINGW_PREFIX ~= nil

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

return M
