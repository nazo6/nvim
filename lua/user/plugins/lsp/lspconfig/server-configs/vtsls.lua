local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup
local root_pattern = require("lspconfig").util.root_pattern

local node_root_pattern = root_pattern("package.json", "tsconfig.json")

require "vtsls"

return create_setup {
  root_dir = node_root_pattern,
  single_file_support = false,
}
