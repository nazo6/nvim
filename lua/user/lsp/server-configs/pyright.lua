local create_setup = require("user.lsp.config-builder").create_setup
local root_pattern = require("lspconfig").util.root_pattern

return create_setup {
  root_dir = root_pattern "pyproject.toml",
}
