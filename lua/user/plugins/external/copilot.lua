return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    init = function()
      map("n", "<leader>cp", "<cmd>Copilot panel<CR>")
    end,
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
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    cmd = { "CopilotChat" },
    opts = {},
  },
}

-- {
--   "github/copilot.vim",
--   event = "InsertEnter",
--   cmd = "Copilot",
--   init = function()
--     require("user.config.copilot").setup()
--   end,
-- },
