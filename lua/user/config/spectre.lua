return {
  setup = function()
    vim.keymap.set("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", { noremap = true, silent = true })
  end,
  config = function()
    require("spectre").setup {}
  end,
}
