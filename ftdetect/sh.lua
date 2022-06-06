vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".latexmkrc",
  callback = function()
    vim.bo.filetype = "perl"
  end,
})
