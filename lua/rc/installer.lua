require("installer").setup {
  debug = true,
  ensure_install = {
    null_ls = { "stylua" },
    tools = { "ripgrep", "sed" },
  },
}
