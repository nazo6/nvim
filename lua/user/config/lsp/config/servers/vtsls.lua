local create_setup = require("user.config.lsp.config.utils").create_setup
local root_pattern = require("lspconfig").util.root_pattern

local node_root_pattern = root_pattern("package.json", "tsconfig.json")

require "vtsls"

return create_setup {
  root_dir = node_root_pattern,
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  single_file_support = false,
 }

