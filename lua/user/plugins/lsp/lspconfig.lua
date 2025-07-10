return Args.feature.vscode and {}
  or {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { { "williamboman/mason.nvim" } },
        config = true,
      },
      {
        "mhanberg/output-panel.nvim",
        config = true,
      },
      { "j-hui/fidget.nvim" },
    },
    cmd = { "LspInfo", "LspLog" },
    event = { "FileType", "BufNewFile" },
    config = function()
      require("user.lsp").setup()
    end,
  }
