local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

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
}
