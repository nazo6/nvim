return {
  "shellRaining/hlchunk.nvim",
  event = { "BufRead" },
  config = function()
    require("hlchunk").setup {
      indent = {
        chars = { "▏" },
      },
      blank = {
        enable = false,
      },
      chunk = {
        style = {
          "#00BB00",
          "#FFFF00",
        },
      },
      line_num = {
        enable = false,
      },
    }
  end,
}
