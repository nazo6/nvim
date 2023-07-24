return {
  "lewis6991/satellite.nvim",
  event = { "BufRead", "InsertEnter", "BufNewFile" },
  config = function()
    require("satellite").setup {
      handlers = {
        gitsigns = {
          enable = false,
        },
      },
    }
  end,
}
