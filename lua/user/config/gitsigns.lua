return {
  setup = function()
    vim.keymap.set("n", "<leader>gb", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", { desc = "Stage hunk" })
  end,
  config = function()
    require("gitsigns").setup {
      signcolumn = false,
      numhl = true,
    }
  end,
}
