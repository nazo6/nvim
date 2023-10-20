local create_config = require("user.plugins.lsp.lspconfig.config-builder").create_config

return function(server)
  local ferris = require "ferris"
  local config = create_config {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  }
  require("lspconfig")[server].setup(config)

  ferris.setup()
end
