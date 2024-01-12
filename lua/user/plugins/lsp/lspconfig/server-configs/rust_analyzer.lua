local create_config = require("user.plugins.lsp.lspconfig.config-builder").create_config

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
  local cfg = require "rustaceanvim.config"

  vim.g.rustaceanvim = function()
    return {
      server = config,
      dap = {
        adapter = cfg.get_codelldb_adapter(
          vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb",
          vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/lldb/lib"
        ),
      },
    }
  end
end
