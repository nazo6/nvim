local filename = vim.fn.fnamemodify(vim.fn.bufname(), ":t")

if filename == "package.json" then
  nnoremap("<leader>ns", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })
  nnoremap("<leader>nc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })
  nnoremap("<leader>nu", ":lua require('package-info').update()<CR>", { silent = true, noremap = true })
  nnoremap("<leader>nd", ":lua require('package-info').delete()<CR>", { silent = true, noremap = true })
  nnoremap("<leader>ni", ":lua require('package-info').install()<CR>", { silent = true, noremap = true })
  nnoremap("<leader>nr", ":lua require('package-info').reinstall()<CR>", { silent = true, noremap = true })
  nnoremap("<leader>np", ":lua require('package-info').change_version()<CR>", { silent = true, noremap = true })
end
