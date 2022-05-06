local merge_functions = require("config.utils").merge_functions
local common_config = require "config.plugin.lsp.configs.common"

local M = {}

M.create_config = function(server_config)
  local config = vim.tbl_deep_extend("force", common_config, server_config)
  config.on_attach = merge_functions(common_config.on_attach, server_config.on_attach)

  return config
end

M.create_setup = function(server_config)
  return function(server)
    local lspconfig = require "lspconfig"
    lspconfig[server.name].setup(M.create_config(server_config))

    server:attach_buffers()
  end
end

M.default_setup = M.create_setup {}

return M
