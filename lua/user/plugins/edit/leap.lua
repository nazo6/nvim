return {
  "ggandor/leap.nvim",
  dependencies = {
    { "tpope/vim-repeat" },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
    { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  },
  config = function()
    map("n", "s", "<Plug>(leap-forward-to)")
    map("n", "S", "<Plug>(leap-backward-to)")
    map("n", "gs", "<Plug>(leap-from-window)")
  end,
}
