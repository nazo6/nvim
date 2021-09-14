return {
  setup = function(config)
    local nullls = require "null-ls"
    nullls.config {
      sources = require("installer/integrations/null_ls").get_all(),
      debug = true
    }

    require("lspconfig")["null-ls"].setup {
      capabilities = config.capabilities,
      on_attach = config.on_attach,
    }
  end,
}
