local create_setup = require("user.lsp.config-builder").create_setup

return create_setup {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
  on_init = function(client)
    -- FIXME:
    -- Disables "pull" diagnostics, which causes problems with rust-analyzer.
    -- Related?: https://github.com/neovim/neovim/issues/29927
    client.server_capabilities.diagnosticProvider = nil
  end,
}
