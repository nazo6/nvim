pcall(require, "impatient")
vim.g.did_load_filetypes = 1

local profile = false

if profile then
  require("plenary.profile").start("profile.log", { flame = true })
end

vim.g.mapleader = " "

inspect = function(...)
  print(require("lib/inspect").inspect(...))
end

require "plugins"
require "keymaps"
require "settings"

if profile then
  require("plenary.profile").stop()
end
