return {
  "shellRaining/hlchunk.nvim",
  event = { "BufRead" },
  config = function()
    require("hlchunk").setup {
      indent = {
        enable = true,
        chars = { "▏" },
      },
      chunk = {
        enable = true,
        style = {
          "#00BB00",
          "#FFFF00",
        },
      },
    }
  end,
}
