local create_config = require("user.config.lsp.config.utils").create_config

return function(server)
  local config = create_config {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  }

  require("rust-tools").setup {
    server = config,
  }
end
