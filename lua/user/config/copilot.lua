return {
  setup = function()
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
