return {
  "neovim/nvim-lspconfig",

  cmd = { "LspInfo", "LspLog", "Neoconf" },
  event = { "BufRead", "BufNewFile" },
  config = function()
    require "user.config.lsp"
  end,
}
