local filename = vim.fn.fnamemodify(vim.fn.bufname(), ":t")

if filename == "cargo.json" then
  vim.keymap.set("n", "ct", ":lua require('crates').toggle()<cr>", { silent = true })
  vim.keymap.set("n", "cr", ":lua require('crates').reload()<cr>", { silent = true })

  vim.keymap.set("n", "cv", ":lua require('crates').show_versions_popup()<cr>", { silent = true })
  vim.keymap.set("n", "cf", ":lua require('crates').show_features_popup()<cr>", { silent = true })

  vim.keymap.set("n", "cu", ":lua require('crates').update_crate()<cr>", { silent = true })
  vim.keymap.set("n", "cu", ":lua require('crates').update_crates()<cr>", { silent = true })
  vim.keymap.set("n", "ca", ":lua require('crates').update_all_crates()<cr>", { silent = true })
  vim.keymap.set("n", "cU", ":lua require('crates').upgrade_crate()<cr>", { silent = true })
  vim.keymap.set("n", "cU", ":lua require('crates').upgrade_crates()<cr>", { silent = true })
  vim.keymap.set("n", "cA", ":lua require('crates').upgrade_all_crates()<cr>", { silent = true })
end
