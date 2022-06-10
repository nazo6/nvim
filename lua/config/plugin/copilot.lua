return {
  setup = function()
    vim.keymap.set("n", "f", "<cmd>HopChar1CurrentLineAC<CR>")
    vim.keymap.set("n", "F", "<cmd>HopChar1CurrentLineBC<CR>")
    vim.keymap.set("n", "<leader><leader>", "<cmd>HopWord<CR>")
    vim.keymap.set("n", "<leader>l", "<cmd>HopLineStart<CR>")
  end,
  config = function()
    require("copilot").setup()
  end,
}
