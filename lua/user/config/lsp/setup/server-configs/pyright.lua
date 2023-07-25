local create_setup = require("user.config.lsp.setup.config-builder").create_setup
local root_pattern = require("lspconfig").util.root_pattern

return create_setup {
  root_dir = root_pattern "pyproject.toml",
}
