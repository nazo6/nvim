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
    }
  end,
}
