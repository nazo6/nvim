vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".swcrc",
  callback = function()
    vim.bo.filetype = "json"
  end,
})
