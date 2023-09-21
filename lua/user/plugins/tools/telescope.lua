return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  event = "BufRead",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "williamboman/mason.nvim" },

    { "jvgrootveld/telescope-zoxide" },
    { "tsakirist/telescope-lazy.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "lpoto/telescope-docker.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "nvim-telescope/telescope-frecency.nvim" },
    { "nazo6/telescope-tailwind.nvim" },
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
  },
  init = function()
    map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "[telescope] Find files" })
    map("n", "<leader>p", "<cmd>Telescope live_grep<CR>", { desc = "[telescope] Live grep" })
    map("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "[telescope] Keymap" })
    map("n", "<leader>z", "<cmd>Telescope zoxide list<CR>", { desc = "[telescope] Zoxide" })
    map("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "[telescope] Undo" })

    map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "[telescope] builtin" })
    map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "[telescope] Buffers" })
    map("n", "<leader>tn", "<cmd>Telescope notify<CR>", { desc = "[telescope] Notifications" })
    map("n", "<leader>tf", "<cmd>Telescope frecency<CR>", { desc = "[telescope] Frecency" })
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
        frecency = {
          use_sqlite = false,
          show_scores = true,
          db_safe_mode = false,
          default_workspace = "CWD",
        },
      },
    }

    require("telescope").load_extension "zoxide"
    require("telescope").load_extension "lazy"
    require("telescope").load_extension "possession"
    require("telescope").load_extension "docker"
    require("telescope").load_extension "undo"
    require("telescope").load_extension "tailwind"
    require("telescope").load_extension "frecency"
  end,
}
