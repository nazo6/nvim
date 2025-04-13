local create_setup = require("user.lsp.config-builder").create_setup
return create_setup {
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}
