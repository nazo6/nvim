require("neoconf").setup()

require("mason-lspconfig").setup()

require "user.config.lsp.setup"

-- Setup lsp related plugins
require("lsp_lines").setup()
require("lsp_signature").setup()
require "user.config.lsp.fidget"
require "user.config.lsp.null-ls"

vim.cmd "LspStart"
