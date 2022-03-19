-- Global plugin settings
local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

local ok, mapx = pcall(require, "mapx")
if ok then
  mapx.setup { global = true }
else
  require "config.global"
end

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.g.loaded_matchparen = 1
