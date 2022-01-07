local create_config = require("rc.lsp.utils").create_config

local root_pattern = require("lspconfig").util.root_pattern
local function no_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

return {
  tsserver = require "rc.lsp.configs.tsserver",
  cssls = create_config { on_attach = no_formatting },
  html = create_config { on_attach = no_formatting },
  jsonls = create_config {
    on_attach = no_formatting,
    filetypes = { "json", "jsonc" },
    settings = { json = { schemas = require("schemastore").json.schemas() } },
  },
  tailwindcss = create_config {
    root_dir = root_pattern("tailwind.config.js", "tailwind.config.ts"),
  },
  sumneko_lua = require "rc.lsp.configs.sumneko_lua",
  rust_analyzer = require "rc.lsp.configs.rust_analyzer",
}
