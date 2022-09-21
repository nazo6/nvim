return {
  setup = function()
    vim.keymap.set("n", "<leader>t", "<cmd>Telescope", { silent = true })
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { silent = true })
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope live_grep<CR>", { silent = true })
  end,
  config = function()
    require("telescope").setup {
      defaults = {
        winblend = 20,
        file_ignore_patterns = { ".git" },
      },
    }
  end,
}
