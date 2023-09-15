local filename = vim.fn.fnamemodify(vim.fn.bufname(), ":t")

if filename == "Cargo.toml" then
  map("n", "ct", ":lua require('crates').toggle()<cr>", { buffer = true })
  map("n", "cr", ":lua require('crates').reload()<cr>", { buffer = true })

  map("n", "cv", ":lua require('crates').show_versions_popup()<cr>", { buffer = true })
  map("n", "cf", ":lua require('crates').show_features_popup()<cr>", { buffer = true })

  map("n", "cu", ":lua require('crates').update_crate()<cr>", { buffer = true })
  map("n", "cu", ":lua require('crates').update_crates()<cr>", { buffer = true })
  map("n", "ca", ":lua require('crates').update_all_crates()<cr>", { buffer = true })
  map("n", "cU", ":lua require('crates').upgrade_crate()<cr>", { buffer = true })
  map("n", "cU", ":lua require('crates').upgrade_crates()<cr>", { buffer = true })
  map("n", "cA", ":lua require('crates').upgrade_all_crates()<cr>", { buffer = true })

  require("cmp").setup.buffer { sources = { { name = "crates" } } }
end
