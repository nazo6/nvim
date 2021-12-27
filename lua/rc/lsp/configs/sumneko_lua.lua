return require("lua-dev").setup {
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
}
