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
    map("n", "<leader>t", "<cmd>Telescope<CR>")
    map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
    map("n", "<leader>p", "<cmd>Telescope live_grep<CR>")
    map("n", "<leader>k", "<cmd>Telescope keymaps<CR>")
    map("n", "<leader>z", "<cmd>Telescope zoxide list<CR>")
    map("n", "<leader>b", "<cmd>Telescope buffers<CR>")
    map("n", "<leader>n", "<cmd>Telescope notify<CR>")
    map("n", "<leader>u", "<cmd>Telescope undo<CR>")
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
