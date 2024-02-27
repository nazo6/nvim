local M = {}

M.script_path = function()
  local str = debug.getinfo(2, "S").source:sub(2)
  if M.is_win then
    str = str:gsub("/", "\\")
  end
  local separator = M.is_win and "\\" or "/"
  return str:match("(.*" .. separator .. ")")
end

return M
