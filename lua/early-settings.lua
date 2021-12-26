-- Global plugin settings
pcall(require, "impatient")

local ok, mapx = pcall(require, "mapx")
if ok then
  mapx.setup { global = true }
end

inspect = function(...)
  print(require("lib/inspect").inspect(...))
end

-- Disable some default vim scripts
vim.g.did_load_filetypes = 1
vim.g.loaded_matchparen = 1
