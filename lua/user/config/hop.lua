return {
  setup = function()
    map("n", "f", "<cmd>HopChar1CurrentLineAC<CR>")
    map("n", "F", "<cmd>HopChar1CurrentLineBC<CR>")
    map("n", "<leader><leader>", "<cmd>HopWord<CR>")
  end,
  config = function()
    require("hop").setup()
  end,
}
