local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

return create_setup {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
}
