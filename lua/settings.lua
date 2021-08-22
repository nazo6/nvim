local cmd = vim.cmd
local set = vim.api.nvim_set_option
local autocmd = require "utils.autocmd"

set("autoread", true)
set("mouse", "a")

autocmd {
  id = "clipboard",
  events = { "BufNewFile", "BufRead" },
  filetypes = "*",
  command = "set clipboard+=unnamedplus",
}
autocmd {
  id = "SetJsonc",
  events = { "BufRead", "BufNewFile" },
  filetypes = "{tsconfig,tsconfig.*}.json",
  command = "setfiletype jsonc",
}
local undodir = tostring(vim.fn.stdpath "data") .. "/undo"
if vim.fn.isdirectory(undodir) ~= 1 then
  vim.fn.mkdir(undodir, "p")
end
set("undodir", undodir)
set("undofile", true)

set("hidden", true)

set("smartcase", true)
set("ignorecase", true)
set("inccommand", "split")

set("completeopt", "menuone,noselect")
set("tabstop", 2)
set("shiftwidth", 2)
set("expandtab", true)

set("confirm", true)

cmd "set relativenumber"
cmd "set signcolumn=number"
cmd "set cursorline"

set("winblend", 15)
set("pumblend", 15)
cmd "hi NormalFloat guifg=#2e3440 guibg=#a3be8c"
cmd "hi Pmenu guifg=#2e3440 guibg=#a3be8c"
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "fern" }
cmd "colorscheme tokyonight"
if vim.fn.has "termguicolors" == 1 then
  set("termguicolors", true)
end

if vim.fn.has "win32" == 1 then
  set("shell", "pwsh")
  set("shellcmdflag", "-NoProfile -c")
  set("shellquote", '\\"')
  set("shellxquote", "")
end
