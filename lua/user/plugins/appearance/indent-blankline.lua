return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufRead" },
  config = function()
    require("indent_blankline").setup {
      show_current_context = true,
      char = "▏",
      context_char = "▏",
    }
  end,
}
