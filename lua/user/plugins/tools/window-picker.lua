return {
  "s1n7ax/nvim-window-picker",
  config = function()
    require("window-picker").setup {
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        bo = {
          filetype = { "NvimTree", "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
      other_win_hl_color = "#e35e4f",
    }
  end,
}
