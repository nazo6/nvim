return {
  "shellRaining/hlchunk.nvim",
  event = { "BufRead" },
  enabled = not Args.feature.vscode,
  tag = "v1.2.0",
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
        delay = 0,
      },
    }
  end,
}
