return {
  setup = function()
    nnoremap("<leader>o", "<cmd>AerialToggle<CR>")
  end,
  config = function()
    require("aerial").setup {
      filter_kind = false,
    }
  end,
}
