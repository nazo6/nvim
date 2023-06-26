local server_configs = require "user.config.lsp.setup.server-configs"
local default_setup = require("user.config.lsp.setup.config-builder").default_setup

local servers = require("mason-lspconfig").get_installed_servers()
vim.list_extend(servers, { "satysfi" })

for _, server_name in ipairs(servers) do
  local config_fn = server_configs[server_name]
  if config_fn == nil then
    config_fn = default_setup
  end
  config_fn(server_name)
end

require "user.config.lsp.setup.attach"
require "user.config.lsp.setup.handlers"
