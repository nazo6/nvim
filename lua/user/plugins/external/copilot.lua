return Args.feature.vscode and {}
  or {
    {
      "zbirenbaum/copilot.lua",
      event = "InsertEnter",
      keys = {
        { mode = "n", "<leader>cp", "<cmd>Copilot panel<CR>" },
      },
      enabled = Args.feature.copilot,
      config = function()
        require("copilot").setup {
          suggestion = {
            enabled = false,
          },
          filetypes = {
            yaml = true,
            markdown = true,
          },
        }
      end,
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "canary",
      enabled = Args.feature.copilot,
      dependencies = {
        { "zbirenbaum/copilot.lua" },
        { "nvim-lua/plenary.nvim" },
      },
      cmd = { "CopilotChat" },
      opts = {},
    },
  }
