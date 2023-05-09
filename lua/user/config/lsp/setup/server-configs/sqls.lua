local create_setup = require("user.config.lsp.setup.config-builder").create_setup

return create_setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    require("sqls").on_attach(client, bufnr)
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = "sqlite3",
          dataSourceName = "../db",
        },
      },
    },
  },
}
