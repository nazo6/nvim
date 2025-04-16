if Args.feature.vscode then
  return {}
end

return {
  "olimorris/codecompanion.nvim",
  keys = {
    { mode = "n", "<leader>ch", "<cmd>CodeCompanionChat<CR>" },
    { mode = "n", "<leader>cc", "<cmd>CodeCompanion<CR>" },
  },
  cmd = { "CodeCompanionChat", "CodeCompanion" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    opts = {
      language = "Japanese",
    },
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
  },
}
