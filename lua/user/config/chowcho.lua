return {
  setup = function()
    vim.keymap.set("n", "<S-Tab>", "<cmd>lua require('chowcho').run()<CR>")
  end,
  config = function()
    require("chowcho").setup {
      icon_enabled = true,
      text_color = "#FFFFFF",
      bg_color = "#555555",
      active_border_color = "#0A8BFF",
      border_style = "default",
    }
  end,
}
