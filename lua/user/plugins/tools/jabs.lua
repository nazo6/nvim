return {
  "matbme/JABS.nvim",
  cmd = "JABSOpen",
  init = function()
    map("n", "<leader><Tab>", "<cmd>JABSOpen<CR>")
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

      keymap = {
        close = "d",
        jump = "<CR>",
        h_split = "h",
        v_split = "v",
        preview = "p",
      },

      use_devicons = true,
    }
  end,
}
