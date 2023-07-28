local server_configs = require "user.config.lsp.setup.server-configs"
local default_setup = require("user.config.lsp.setup.config-builder").default_setup

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

local local_servers = { "satysfi" }
for _, server_name in ipairs(local_servers) do
  setup(server_name)
end

require "user.config.lsp.setup.attach"
require "user.config.lsp.setup.handlers"
