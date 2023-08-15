return {
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
      },
    }
  end,
}

-- {
--   "github/copilot.vim",
--   event = "InsertEnter",
--   cmd = "Copilot",
--   init = function()
--     require("user.config.copilot").setup()
--   end,
-- },
