local create_setup = require("user.lsp.config-builder").create_setup

return create_setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
}
