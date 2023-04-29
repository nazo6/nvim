local server_configs = require "user.config.lsp.config.servers"
local default_setup = require "user.config.lsp.config.utils".default_setup

local servers = require"mason-lspconfig".get_installed_servers()
vim.list_extend(servers, {"satysfi"})

require"user.config.lsp.config.common"

for _, server_name in ipairs(servers) do
  local config_fn = server_configs[server_name]
  if config_fn == nil then
    default_setup(server_name)
  else
    config_fn(server_name)
  end
end
