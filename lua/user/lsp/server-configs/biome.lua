local create_setup = require("user.lsp.config-builder").create_setup

return create_setup {
  root_dir = function(bufnr, cb)
    cb(vim.fs.root(bufnr, "biome.json"))
  end,
}
