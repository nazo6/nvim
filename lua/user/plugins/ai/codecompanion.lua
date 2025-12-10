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
  config = function()
    require("user.plugins.ai.codecompanion.fidget"):init()
    require("codecompanion").setup {
      opts = {
        language = "Japanese",
      },
      display = {
        chat = {
          window = {
            width = 0.25,
            position = "right",
          },
        },
      },
      strategies = {
        chat = {
          roles = {
            llm = function(adapter)
              return "  CodeCompanion (" .. adapter.formatted_name .. ", " .. adapter.model.name .. ")"
            end,
            user = "  Me",
          },
        },
      },
    }
  end,
}
