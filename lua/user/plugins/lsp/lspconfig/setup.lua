local server_configs = require "user.plugins.lsp.lspconfig.server-configs"
local default_setup = require("user.plugins.lsp.lspconfig.config-builder").default_setup

local function setup(server_name)
  local config_fn = server_configs[server_name]
  if config_fn == nil then
    config_fn = default_setup
  end
  config_fn(server_name)
end

require("mason-lspconfig").setup_handlers {
  function(server_name)
    setup(server_name)
  end,
}

for _, server_name in ipairs(Args.lsp.local_servers) do
  setup(server_name)
end

require "user.plugins.lsp.lspconfig.attach"
