return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  event = "BufRead",
  cmd = "GitSigns",
  init = function()
    map("n", "<C-g><C-b>", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", { desc = "Stage hunk" })
  end,
  config = function()
    require("gitsigns").setup {
      signcolumn = false,
      numhl = true,
    }
  end,
}
