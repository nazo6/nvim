return {
  setup = function()
    vim.keymap.set("n", "<leader>t", "<cmd>Telescope<CR>")
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope live_grep<CR>")
    vim.keymap.set("n", "<leader>z", "<cmd>Telescope zoxide list<CR>")
  end,
  config = function()
    vim.cmd [[packadd telescope-zoxide]]

    require("telescope").setup {
      defaults = {
        winblend = 30,
        file_ignore_patterns = { ".git" },
      },
    }

    require("telescope").load_extension "zoxide"
  end,
}
