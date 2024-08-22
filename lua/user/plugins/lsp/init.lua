return Args.feature.vscode and {}
  or {
    { "onsails/lspkind-nvim" },
    { "mhanberg/output-panel.nvim" },
    { "b0o/schemastore.nvim" },
    { "SmiteshP/nvim-navic", event = { "InsertEnter", "BufRead" } },
    {
      "lsp_lines.nvim",
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = true,
    },
    { "aznhe21/actions-preview.nvim" },

    {
      {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-tree.lua",
        },
        event = "LspAttach",
        config = function()
          require("lsp-file-operations").setup()
        end,
      },
    },
  }
