local M = {}

M.create_setup = function(server_config)
  return function(server_name)
    local lspconfig = require "lspconfig"
    lspconfig[server_name].setup(server_config)
  end
end

M.default_setup = M.create_setup {}

return M
