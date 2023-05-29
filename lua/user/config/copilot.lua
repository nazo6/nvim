return {
  setup = function()
    map("n", "<leader>cp", "<cmd>Copilot panel<CR>")
    vim.g.copilot_no_tab_map = true
  end,
  -- config = function()
  --   require("copilot").setup {
  --     suggestion = {
  --       enabled = false,
  --     },
  --   }
  -- end,
}
