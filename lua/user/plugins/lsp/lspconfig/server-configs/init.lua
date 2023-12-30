local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup
local srequire = function(server)
  return require("user.plugins.lsp.lspconfig.server-configs." .. server)
end

return {
  tsserver = srequire "tsserver",
  vtsls = srequire "vtsls",
  biome = srequire "biome",
  denols = srequire "denols",
  jsonls = create_setup {
    filetypes = { "json", "jsonc" },
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  tailwindcss = srequire "tailwindcss",
  lua_ls = srequire "lua_ls",
  rust_analyzer = srequire "rust_analyzer",
  texlab = srequire "texlab",
  sqls = srequire "sqls",
  fsautocomplete = srequire "fsautocomplete",
  omnisharp = srequire "omnisharp",
  clangd = srequire "clangd",
  pyright = srequire "pyright",
  typst_lsp = srequire "typst_lsp",
}
