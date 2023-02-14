return {
  setup = function()
    vim.keymap.set("n", "<leader>t", "<cmd>Telescope<CR>")
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope live_grep<CR>")
    vim.keymap.set("n", "<leader>k", "<cmd>Telescope keymaps<CR>")
    vim.keymap.set("n", "<leader>z", "<cmd>Telescope zoxide list<CR>")
    vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
  end,
  config = function()
    require("telescope").load_extension "zoxide"
    require("telescope").load_extension "lazy"

    local actions = require "telescope.actions"
    require("telescope").setup {
      defaults = {
        winblend = 30,
        file_ignore_patterns = { ".git" },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
    }
  end,
}
