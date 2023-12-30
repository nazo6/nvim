local root_pattern = require("lspconfig").util.root_pattern
local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

return create_setup {
  root_dir = root_pattern "biome.json",
  single_file_support = false,
}
