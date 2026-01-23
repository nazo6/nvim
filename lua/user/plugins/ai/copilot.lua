if not Args.feature.ai.copilot or Args.feature.vscode then
  return {}
end

return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
    event = { "BufRead", "BufNewFile" },
    cmd = { "Copilot" },
    keys = {
      { mode = "n", "<leader>cp", "<cmd>Copilot panel<CR>" },
    },
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
    "folke/sidekick.nvim",
    opts = {},
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
    },
    enabled = Args.feature.ai.sidekick,
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
    },
  },
}
