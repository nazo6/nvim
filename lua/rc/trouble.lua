return {
  keymap = function()
    nnoremap("<leader>x", "<cmd>TroubleToggle<CR>", { noremap = true, silent = true })
  end,
  setup = function()
    require("trouble").setup {}
  end,
}
