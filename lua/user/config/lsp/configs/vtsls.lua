local create_setup = require("user.config.lsp.utils").create_setup

require "vtsls"

return create_setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
