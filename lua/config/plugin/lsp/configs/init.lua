local create_setup = require("config.plugin.lsp.utils").create_setup

local root_pattern = require("lspconfig").util.root_pattern
local function no_formatting(client)
  client.server_capabilities.documentFormattingProvider = false
end

return {
  tsserver = require "config.plugin.lsp.configs.tsserver",
  denols = require "config.plugin.lsp.configs.denols",
  cssls = create_setup { on_attach = no_formatting },
  html = create_setup { on_attach = no_formatting },
  jsonls = create_setup {
    on_attach = no_formatting,
    filetypes = { "json", "jsonc" },
    settings = { json = { schemas = require("schemastore").json.schemas() } },
  },
  tailwindcss = create_setup {
    root_dir = root_pattern("tailwind.config.js", "tailwind.config.ts"),
  },
  sumneko_lua = require "config.plugin.lsp.configs.sumneko_lua",
  rust_analyzer = require "config.plugin.lsp.configs.rust_analyzer",
  texlab = require "config.plugin.lsp.configs.texlab",
  sqls = require "config.plugin.lsp.configs.sqls",
  fsautocomplete = require "config.plugin.lsp.configs.fsautocomplete",
}
