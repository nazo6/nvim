return {
  setup = function()
    nnoremap("<C-p>", "<cmd>Telescope<CR>", "silent")
    nnoremap("<leader>p", "<cmd>Telescope live_grep<CR>", "silent")
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
