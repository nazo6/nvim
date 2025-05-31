local create_setup = require("user.lsp.config-builder").create_setup
return create_setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
}
