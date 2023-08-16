return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { { "williamboman/mason.nvim" } },
      config = true,
    },
    -- {
    --   "mhanberg/output-panel.nvim",
    --   config = true,
    -- },
    { "j-hui/fidget.nvim" },
    {
      "folke/neoconf.nvim",
      config = function()
        require("neoconf").setup {
          plugins = {
            jsonls = {
              enabled = true,
              configured_servers_only = false,
            },
          },
        }
      end,
    },
  },
  cmd = { "LspInfo", "LspLog", "Neoconf" },
  event = { "BufRead", "BufNewFile" },
  config = function()
    require "user.plugins.lsp.lspconfig.setup"
  end,
}
