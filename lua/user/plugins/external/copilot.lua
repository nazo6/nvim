return {
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
          enabled = true,
          auto_trigger = false,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-n>",
            prev = "<M-p>",
            dismiss = "<C-]>",
          },
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
