return {
  "brenoprata10/nvim-highlight-colors",
  cmd = { "HighlightColors" },
  event = { "BufRead" },
  config = function()
    require("nvim-highlight-colors").setup {
      render = "virtual",
      enable_tailwind = true,
    }
  end,
}
