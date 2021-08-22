return {
  setup = function(config)
    local nullls = require "null-ls"
    nullls.config {
      sources = {
        nullls.builtins.formatting.stylua,
      },
    }

    require("lspconfig")["null-ls"].setup {
      capabilities = config.capabilities,
      on_attach = config.on_attach,
    }
  end,
}
