if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "NvimTree" }

vim.cmd [[
function! CustomHighlights() abort
  highlight MatchParen ctermbg=6 gui=bold,underline guifg=#ff9e64

  highlight TreesitterContext guibg=#3c3d37

  highlight NvimTreeGitDeleted guifg=red
  highlight NvimTreeGitRenamed guifg=yellow
  highlight NvimTreeGitNew guifg=green
  highlight NvimTreeGitDirty guifg=red
	highlight NvimTreeGitStaged guifg=yellow
	highlight NvimTreeGitMerge guifg=cyan
endfunction

augroup CustomColors
  autocmd!
  autocmd ColorScheme * call CustomHighlights()
augroup END

colorscheme tokyonight
]]
