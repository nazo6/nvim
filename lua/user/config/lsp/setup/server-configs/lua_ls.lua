local create_setup = require("user.config.lsp.setup.config-builder").create_setup

require("neodev").setup {
  library = {
    enabled = false,
  },
}

return create_setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
