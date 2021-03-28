vim.api.nvim_set_option('number',true)

vim.api.nvim_set_option('tabstop',2)
vim.api.nvim_set_option('shiftwidth',2)
vim.api.nvim_set_option('expandtab',true)

if vim.fn.has('win32') == 1 then
  vim.api.nvim_set_option('shell','pwsh')
  vim.api.nvim_set_option('shellcmdflag','-c')
  vim.api.nvim_set_option('shellquote',[[\"]])
  vim.api.nvim_set_option('shellxquote','')
end

vim.api.nvim_set_option('clipboard','unnamedplus')

vim.cmd('colorscheme codedark')
