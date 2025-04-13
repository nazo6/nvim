local create_setup = require("user.lsp.config-builder").create_setup

return create_setup {
  init_options = {
    typescript = {
      enabled = true,
    },
  },
}
