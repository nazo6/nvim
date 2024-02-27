return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "williamboman/mason.nvim" },

      { "jvgrootveld/telescope-zoxide" },
      { "tsakirist/telescope-lazy.nvim" },
      { "nvim-telescope/telescope-symbols.nvim" },
      { "lpoto/telescope-docker.nvim" },
      { "debugloop/telescope-undo.nvim" },
      { "nazo6/telescope-tailwind.nvim" },
      { "fdschmidt93/telescope-egrepify.nvim" },
    },
    init = function()
      map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "[telescope] Find files" })
      map("n", "<leader>p", "<cmd>Telescope egrepify<CR>", { desc = "[telescope] Live grep" })
      map("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "[telescope] Keymap" })
      map("n", "<leader>z", "<cmd>Telescope zoxide list<CR>", { desc = "[telescope] Zoxide" })
      map("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "[telescope] Undo" })

      map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "[telescope] builtin" })
      map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "[telescope] Buffers" })
      map("n", "<leader>tn", "<cmd>Telescope notify<CR>", { desc = "[telescope] Notifications" })
    end,
    config = function()
      local actions = require "telescope.actions"
      require("telescope").setup {
        defaults = {
          winblend = 15,
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
        pickers = {
          keymaps = {
            show_plug = false,
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
    end,
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
}
