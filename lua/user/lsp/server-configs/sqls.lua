local create_setup = require("user.lsp.config-builder").create_setup

return create_setup {
  on_attach = function(client, bufnr)
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
