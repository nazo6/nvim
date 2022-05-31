return {
  setup = function()
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope<CR>", { silent = true })
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope live_grep<CR>", { silent = true })
  end,
  config = function()
    require("telescope").setup {
      defaults = {
        vimgrep_arguments = {
          require("installer.integrations.tools").get "ripgrep",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
      },
    }
  end,
}
