return {
  {
    "eandrju/cellular-automaton.nvim",
    cmd = { "CellularAutomaton" },
  },
  {
    "OXY2DEV/helpview.nvim",
    ft = "help",
    submodules = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "shortcuts/no-neck-pain.nvim",
    cmd = { "NoNeckPain" },
    keys = { { "<leader>n", mode = { "n" }, "<cmd>NoNeckPain<CR>" } },
    opts = {
      width = 180,
    },
  },
}
