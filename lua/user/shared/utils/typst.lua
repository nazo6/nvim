-- Utils for typst
local M = {}

--- Main file of the given typst file.
M.get_typst_main_file = function(path)
  for _, pattern in ipairs { "root.typ", "report.typ" } do
    local dir = vim.fs.root(path, pattern)
    if dir ~= nil then
      return vim.fs.joinpath(dir, pattern)
    end
  end
  return nil
end

--- Root dir of typst. This is basically parent directory of main_file, but it falls back to .git if not found.
M.get_typst_root_dir = function(path)
  local root_file = M.get_typst_main_file(path)
  local root_dir
  if root_file == nil then
    root_dir = vim.fs.root(path, { ".git" })
  else
    root_dir = vim.fs.dirname(root_file)
  end
  return root_dir
end

return M
