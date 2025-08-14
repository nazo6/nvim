return Args.feature.vscode and {}
  or {
    { "onsails/lspkind-nvim" },
    { "b0o/schemastore.nvim" },
    { "SmiteshP/nvim-navic", event = { "InsertEnter", "BufRead" } },
    { "aznhe21/actions-preview.nvim" },
    {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "LspAttach", -- Or `LspAttach`
      priority = 1000, -- needs to be loaded in first
      config = function()
        vim.diagnostic.config { virtual_text = false }
        require("tiny-inline-diagnostic").setup {
          options = {
            show_source = true,
          },
        }
      end,
    },

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
