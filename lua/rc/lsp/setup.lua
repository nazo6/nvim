local server_config = require "rc.lsp.server-config"
local common_config = require "rc.lsp.config"

for key, _ in pairs(server_config) do
  local server_on_attach = server_config[key].on_attach
  server_config[key].on_attach = function(client, bufnr)
    if server_on_attach ~= nil then
      server_on_attach(client, bufnr)
    end
    common_config.on_attach(client, bufnr)
  end
end

require("installer.integrations.ls").setup {
  configs = server_config,
  enable_hook = true,
  global_config = {
    on_attach = common_config.on_attach,
    capabilities = common_config.capabilities,
  },
}

require "rc.lsp.null-ls"
