local filename = vim.fn.fnamemodify(vim.fn.bufname(), ":t")

if filename == "cargo.json" then
  nnoremap("ct", ":lua require('crates').toggle()<cr>", { silent = true })
  nnoremap("cr", ":lua require('crates').reload()<cr>", { silent = true })

  nnoremap("cv", ":lua require('crates').show_versions_popup()<cr>", { silent = true })
  nnoremap("cf", ":lua require('crates').show_features_popup()<cr>", { silent = true })

  nnoremap("cu", ":lua require('crates').update_crate()<cr>", { silent = true })
  nnoremap("cu", ":lua require('crates').update_crates()<cr>", { silent = true })
  nnoremap("ca", ":lua require('crates').update_all_crates()<cr>", { silent = true })
  nnoremap("cU", ":lua require('crates').upgrade_crate()<cr>", { silent = true })
  nnoremap("cU", ":lua require('crates').upgrade_crates()<cr>", { silent = true })
  nnoremap("cA", ":lua require('crates').upgrade_all_crates()<cr>", { silent = true })
end
