return {
  "uga-rosa/ccc.nvim",
  cmd = { "CccPick" },
  event = { "BufRead" },
  config = function()
    require("ccc").setup {
      highlighter = {
        auto_enable = false,
      },
    }
  end,
}
