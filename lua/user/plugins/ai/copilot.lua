if not Args.feature.ai.copilot or Args.feature.vscode then
  return {}
end

return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "copilotlsp-nvim/copilot-lsp" },
    },
    event = { "FileType", "BufNewFile" },
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
        nes = {
          enabled = true,
          keymap = {
            accept_and_goto = "<leader>p",
            accept = false,
            dismiss = "<Esc>",
          },
        },
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    cmd = { "CopilotChat" },
    opts = {},
  },
}
