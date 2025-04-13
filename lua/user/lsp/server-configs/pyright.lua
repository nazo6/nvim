local create_setup = require("user.lsp.config-builder").create_setup

return create_setup {
  root_dir = vim.fs.root(0, "pyproject.toml"),
}
