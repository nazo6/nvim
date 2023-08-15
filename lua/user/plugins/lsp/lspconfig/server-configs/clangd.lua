local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

return create_setup {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
