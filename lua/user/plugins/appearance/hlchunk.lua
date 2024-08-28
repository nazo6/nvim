return {
  "shellRaining/hlchunk.nvim",
  event = { "BufRead" },
  enabled = not Args.feature.vscode,
  config = function()
    require("hlchunk").setup {
      indent = {
        enable = true,
        chars = { "▏" },
        exclude_filetypes = {
          fidget = true,
        },
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
