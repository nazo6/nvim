local create_config = require("config.plugin.lsp.utils").create_config

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
