return {
  setup = function()
    nnoremap("f", "<cmd>HopChar1CurrentLineAC<CR>")
    nnoremap("F", "<cmd>HopChar1CurrentLineBC<CR>")
    nnoremap("<leader><leader>", "<cmd>HopWord<CR>")
    nnoremap("<leader>l", "<cmd>HopLineStart<CR>")
  end,
  config = function()
    require("hop").setup()
  end,
}
