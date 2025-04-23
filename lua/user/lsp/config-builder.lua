local client_capabilities = require("blink.cmp").get_lsp_capabilities {
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
      "sortText",
      "filterText",
      "insertText",
      "insertTextFormat",
      "insertTextMode",
    },
  },
  textDocument = {
    foldingRange = {
      lineFoldingOnly = true,
    },
  },
}
local base_config = {
  capabilities = client_capabilities,
}

local M = {}

M.create_config = function(server_config)
  return vim.tbl_deep_extend("force", base_config, server_config)
end

--- @param server_config vim.lsp.Config|fun(server_name: string):vim.lsp.Config
M.create_setup = function(server_config)
  return function(server_name)
    if type(server_config) == "function" then
      server_config = server_config(server_name)
    end
    vim.lsp.config(server_name, M.create_config(server_config))
    vim.lsp.enable(server_name)
  end
end

M.default_setup = M.create_setup {}

return M
