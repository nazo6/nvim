-- Global plugin settings
pcall(require, "impatient")

local ok, mapx = pcall(require, "mapx")
local wk_ok = pcall(require, "which-key")
if ok then
  if wk_ok then
    mapx.setup { global = true, whichkey = true }
  else
    mapx.setup { global = true }
  end
end

inspect = function(...)
  print(require("lib/inspect").inspect(...))
end

-- Disable some default vim scripts
vim.g.did_load_filetypes = 1
vim.g.loaded_matchparen = 1
