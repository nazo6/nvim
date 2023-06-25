require("neoconf").setup {
  plugins = {
    jsonls = {
      enabled = true,
      configured_servers_only = false,
    },
  },
}

require("mason-lspconfig").setup()

require "user.config.lsp.setup"

-- Setup lsp related plugins
require("lsp_lines").setup()
require("output_panel").setup()
require "user.config.lsp.fidget"
require "user.config.lsp.null-ls"

vim.cmd "LspStart"
