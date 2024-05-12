local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

return create_setup {
  handlers = {
    ["textDocument/definition"] = function(...)
      require("omnisharp_extended").handler(...)
    end,
  },
}
