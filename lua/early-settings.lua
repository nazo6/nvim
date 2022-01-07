-- Global plugin settings
local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

local ok, mapx = pcall(require, "mapx")
if ok then
  mapx.setup { global = true }
else
  require "global"
end

-- Disable some default vim scripts
vim.g.did_load_filetypes = 1
vim.g.loaded_matchparen = 1
