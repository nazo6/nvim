return {
  keymaps = function()
    nnoremap("<C-p>", "<cmd>Telescope<CR>", "silent")
    nnoremap("<leader>p", "<cmd>Telescope live_grep<CR>", "silent")
  end,
  setup = function()
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

    require("telescope").load_extension "neoclip"
  end,
}
