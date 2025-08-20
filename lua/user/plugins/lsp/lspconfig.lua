return Args.feature.vscode and {}
  or {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { { "williamboman/mason.nvim" } },
        opts = {
          automatic_enable = false,
        },
      },
      { "j-hui/fidget.nvim" },
    },
    cmd = { "LspInfo", "LspLog" },
    event = { "FileType", "BufNewFile" },
    config = function()
      require("user.lsp").setup()
    end,
  }
