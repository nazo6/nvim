local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup
local root_pattern = require("lspconfig").util.root_pattern

local node_or_deno = require("user.plugins.lsp.lspconfig.server-configs.ts_util").node_or_deno

return create_setup {
  root_dir = node_or_deno "deno",
  settings = {
    enable = true,
    lint = true,
    unstable = true,
  },
  on_attach = function(client)
    client.server_capabilities.executeCommandProvider = true
  end,
}
