if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

vim.cmd "autocmd ColorScheme * highlight MatchParen ctermbg=6 gui=bold,underline guifg=#ff9e64"

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "NvimTree" }

vim.cmd "colorscheme tokyonight"
