local M = {}

local client_capabilities = require("cmp_nvim_lsp").default_capabilities()
client_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
client_capabilities.textDocument.colorProvider = {
  dynamicRegistration = true,
}
local base_config = {
  capabilities = client_capabilities,
}

M.create_config = function(server_config)
  return vim.tbl_deep_extend("force", base_config, server_config)
end

M.create_setup = function(server_config)
  return function(server_name)
    local lspconfig = require "lspconfig"
    lspconfig[server_name].setup(M.create_config(server_config))
  end
end

M.default_setup = M.create_setup {}

return M
