local M = {}

local function unflatten(tbl)
  local result = {}

  for flat_key, value in pairs(tbl) do
    local current = result
    local parts = {}
    for part in string.gmatch(flat_key, "[^%.]+") do
      table.insert(parts, part)
    end
    for i = 1, #parts - 1 do
      local part = parts[i]
      if current[part] == nil then
        current[part] = {}
      end
      current = current[part]
    end
    current[parts[#parts]] = value
  end

  return result
end

M.config = function()
  local root_dir = vim.fs.normalize(vim.fn.expand "%:p:h")

  local json_p = vim.fs.root(root_dir, { ".vscode/settings.json" })
  if json_p == nil then
    return
  end
  json_p = vim.fs.joinpath(json_p, "settings.json")
  local lines = vim.fn.readfile(json_p)
  local text = table.concat(lines, "\n")

  local json = require "user.shared.json"
  require "user.shared.json.jsonc"
  local content = json.decode_jsonc(text)
  content = unflatten(content)

  vim.lsp.config("*", {
    settings = content,
  })
end

return M
