require("mason").setup()
require("mason-lspconfig").setup()

local index = require "mason-registry.index"
index["sed"] = "mason-custom-registry.sed"
index["gitui"] = "mason-custom-registry.gitui"
index["ripgrep"] = "mason-custom-registry.ripgrep"

local ensure_installed = {
  "lua-language-server",
  "stylua",
  "ripgrep",
  "gitui",
}

if require("user.utils").is_win then
  table.insert(ensure_installed, "sed")
end

require("mason-tool-installer").setup {
  ensure_installed = ensure_installed,
  auto_update = false,
  run_on_start = true,
  start_delay = 3000,
}
require("mason-tool-installer").run_on_start()
