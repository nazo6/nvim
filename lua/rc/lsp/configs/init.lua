local root_pattern = require("lspconfig").util.root_pattern
local function no_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

return {
  tsserver = require "rc.lsp.configs.tsserver",
  cssls = { on_attach = no_formatting },
  html = { on_attach = no_formatting },
  jsonls = require "rc.lsp.configs.jsonls",
  tailwindcss = {
    root_dir = root_pattern("tailwind.config.js", "tailwind.config.ts"),
  },
  sumneko_lua = require "rc.lsp.configs.sumneko_lua",
  rust_analyzer = require "rc.lsp.configs.rust_analyzer",
}
