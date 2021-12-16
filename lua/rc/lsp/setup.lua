local lspconfig = require "lspconfig"

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

require "rc.lsp.custom-servers"

local lsp_installer = require "nvim-lsp-installer"

lsp_installer.on_server_ready(function(server)
  local opts = server_config[server.name] or common_config
  server:setup(opts)
end)

require "rc.lsp.null-ls"
