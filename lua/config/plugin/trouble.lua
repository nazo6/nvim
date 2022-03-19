return {
  setup = function()
    nnoremap("<leader>x", "<cmd>TroubleToggle<CR>", { noremap = true, silent = true })
  end,
  config = function()
    require("trouble").setup {}
  end,
}
