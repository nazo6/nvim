local create_setup = require("config.plugin.lsp.utils").create_setup
return create_setup(require("lua-dev").setup {
  library = {
    vimruntime = true,
    types = true,
    plugins = true,
  },
  lspconfig = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
})
