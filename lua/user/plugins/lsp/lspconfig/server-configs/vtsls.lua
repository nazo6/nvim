local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup
local node_or_deno = require("user.plugins.lsp.lspconfig.server-configs.ts_util").node_or_deno
local root_pattern = require("lspconfig").util.root_pattern

require "vtsls"

return create_setup {
  root_dir = node_or_deno "node",
  single_file_support = false,
}
