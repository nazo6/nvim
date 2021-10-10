local cmd = vim.cmd
local opt = vim.opt
local autocmd = require "utils.autocmd"

--- Behavior
opt.autoread = true
opt.mouse = "a"
opt.clipboard:append "unnamedplus"

opt.confirm = true

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

cmd "hi NormalFloat guifg=#2e3440 guibg=#a3be8c"
cmd "hi Pmenu guifg=#2e3440 guibg=#a3be8c"
if vim.fn.has "termguicolors" == 1 then
  opt.termguicolors = true
end

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "NvimTree" }

vim.cmd "colorscheme tokyonight"

-- Type specific
autocmd {
  id = "SetJsonc",
  events = { "BufRead", "BufNewFile" },
  filetypes = "{tsconfig,tsconfig.*}.json",
  command = "setfiletype jsonc",
}
