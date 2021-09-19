local server_configs = require "rc.lsp.serverconfigs"
local common_config = require "rc.lsp.config"

require("installer.integrations.null_ls").setup {
  configs = {
    debug = true,
  },
  enable_hook = true,
}
require("lspconfig")["null-ls"].setup {
  capabilities = common_config.capabilities,
  on_attach = common_config.on_attach,
}

for key, _ in pairs(server_configs) do
  local server_on_attach = server_configs[key].on_attach
  server_configs[key].on_attach = function(client, bufnr)
    if server_on_attach ~= nil then
      server_on_attach(client, bufnr)
    end
    common_config.on_attach(client, bufnr)
  end
  server_configs.capabilities = common_config.capabilities
end

require("installer.integrations.ls").setup {
  configs = server_configs,
  enable_hook = true,
}

require("lspkind").init {}
