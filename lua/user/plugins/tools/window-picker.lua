return {
  "s1n7ax/nvim-window-picker",
  config = function()
    require("window-picker").setup {
      autoselect_one = true,
      filter_rules = {
        bo = {
          filetype = { "NvimTree", "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
      highlights = {
        statusline = {
          focused = {
            fg = "#ededed",
            bg = "#e35e4f",
            bold = true,
          },
          unfocused = {
            fg = "#ededed",
            bg = "#e35e4f",
            bold = true,
          },
        },
      },
    }
  end,
}
