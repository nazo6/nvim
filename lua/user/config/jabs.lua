return {
  setup = function()
    vim.keymap.set("n", "<Tab>", "<cmd>JABSOpen<CR>")
  end,
  config = function()
    require("jabs").setup {
      position = "center",
      width = 80,
      height = 20,
      border = "single",

      preview_position = "left",

      highlight = {
        current = "Title",
        hidden = "StatusLineNC",
        split = "WarningMsg",
        alternate = "StatusLine",
      },

      symbols = {
        current = "C",
        split = "S",
        alternate = "A",
        hidden = "H",
        locked = "L",
        ro = "R",
        edited = "E",
        terminal = "T",
        default_file = "D",
      },

      keymap = {
        close = "d",
        jump = "<space>",
        h_split = "h",
        v_split = "v",
        preview = "p",
      },

      use_devicons = true,
    }
  end,
}
