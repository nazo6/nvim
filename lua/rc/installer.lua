require("installer").setup({
  debug = true,
  ensure_install = {
    ls = { "tsserver", "html", "jsonls", "cssls", "sumneko_lua" },
    null_ls = { "stylua" },
    tools = { "ripgrep" },
  },
})
