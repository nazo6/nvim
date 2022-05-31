return {
  setup = function()
    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>")
  end,
  config = function()
    require("aerial").setup {
      filter_kind = false,
    }
  end,
}
