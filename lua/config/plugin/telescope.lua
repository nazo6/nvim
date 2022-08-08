return {
  setup = function()
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { silent = true })
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope live_grep<CR>", { silent = true })
  end,
  config = function()
    require("telescope").setup {
      defaults = {
        winblend = 20,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        file_ignore_patterns = { ".git" },
      },
    }
  end,
}
