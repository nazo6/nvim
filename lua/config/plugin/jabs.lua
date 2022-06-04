return {
  setup = function()
    vim.keymap.set("n", "<Tab>", "<cmd>JABSOpen<CR>")
  end,
  config = function()
    require("jabs").setup {}
  end,
}
