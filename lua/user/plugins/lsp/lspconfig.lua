return Args.feature.vscode and {}
  or {
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
        cmd = { "Neoconf" },
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
    cmd = { "LspInfo", "LspLog" },
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "user.plugins.lsp.lspconfig.setup"
    end,
  }
