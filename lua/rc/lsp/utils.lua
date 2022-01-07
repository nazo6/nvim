local merge_functions = require("utils").merge_functions
local common_config = require "rc.lsp.configs.common"

local M = {}

M.create_config = function(server_config)
  return function(server)
    local opts = vim.tbl_deep_extend("force", common_config, server_config)
    opts.on_attach = merge_functions(common_config.on_attach, server_config.on_attach)

    server:setup(opts)
  end
end

M.default_config = M.create_config(common_config)

return M
