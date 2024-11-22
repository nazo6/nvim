return {
  "brenoprata10/nvim-highlight-colors",
  cmd = { "HighlightColors" },
  event = { "BufRead" },
  -- I found out that tinymist crashes with documentColor lsp request, so temporarily disabled
  enabled = false,
  config = function()
    require("nvim-highlight-colors").setup {
      render = "virtual",
      enable_tailwind = true,
      enable_short_hex = false,
    }
  end,
}
