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
    local actions = require "telescope.actions"
    require("telescope").setup {
      defaults = {
        winblend = 30,
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
      extensions = {
        zoxide = {
          mappings = {
            default = {
              action = function(selection)
                vim.cmd.tcd(selection.path)
              end,
            },
          },
        },
      },
    }

    require("telescope").load_extension "zoxide"
    require("telescope").load_extension "lazy"
  end,
}
