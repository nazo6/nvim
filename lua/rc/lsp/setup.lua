local server_configs = require "rc.lsp.serverconfigs"
local common_config = require "rc.lsp.config"

require("rc.lsp.null-ls").setup(common_config)

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

require("installer").setup {}
require("installer.integrations.ls").setup {
  configs = server_configs,
}

require("lspkind").init {}
require("lspsaga").init_lsp_saga()
