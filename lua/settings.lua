local cmd = vim.cmd
local opt = vim.opt
local autocmd = require "utils.autocmd"

--- Behavior
opt.autoread = true
opt.mouse = "a"
if vim.fn.has "wsl" then
  vim.cmd [[
    let g:clipboard = {
     \ 'name': 'win32yank',
     \ 'copy': {
     \    '+': 'win32yank.exe -i --crlf',
     \    '*': 'win32yank.exe -i --crlf',
     \  },
     \ 'paste': {
     \    '+': 'win32yank.exe -o --lf',
     \    '*': 'win32yank.exe -o --lf',
     \ },
     \ 'cache_enabled': 0,
     \ }
  ]]
end
opt.clipboard:append "unnamedplus"

opt.confirm = true
opt.wildmenu = true

opt.hidden = true

local undodir = tostring(vim.fn.stdpath "data") .. "/undo"
if vim.fn.isdirectory(undodir) ~= 1 then
  vim.fn.mkdir(undodir, "p")
end
opt.undodir = undodir
opt.undofile = true

opt.smartcase = true
opt.ignorecase = true
opt.inccommand = "split"

opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

--- Editing

opt.completeopt = "menuone,noselect"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

--- Appearance
opt.number = true
opt.signcolumn = "number"
opt.cursorline = true

opt.winblend = 15
opt.pumblend = 15

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "NvimTree" }

if vim.fn.has "termguicolors" == 1 then
  opt.termguicolors = true
end
cmd "autocmd ColorScheme * highlight MatchParen ctermbg=6 gui=bold,underline guifg=#ff9e64"
vim.cmd "colorscheme tokyonight"

-- Type specific
autocmd {
  id = "SetJsonc",
  events = { "BufRead", "BufNewFile" },
  filetypes = "{tsconfig,tsconfig.*}.json",
  command = "setfiletype jsonc",
}
