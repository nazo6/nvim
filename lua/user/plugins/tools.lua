return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "jvgrootveld/telescope-zoxide" },
      { "tsakirist/telescope-lazy.nvim" },
      { "nvim-telescope/telescope-symbols.nvim" },
    },
    init = function()
      require("user.config.telescope").setup()
    end,
    config = function()
      require("user.config.telescope").config()
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

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "v1.*",
        config = function()
          require("window-picker").setup {
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              bo = {
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                buftype = { "terminal", "quickfix" },
              },
            },
            other_win_hl_color = "#e35e4f",
          }
        end,
      },
    },
    init = function()
      require("user.config.neo-tree").setup()
    end,
    config = function()
      require("user.config.neo-tree").config()
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    cmd = { "Trouble", "TroubleToggle" },
    init = function()
      require("user.config.trouble").setup()
    end,
    config = function()
      require("user.config.trouble").config()
    end,
  },

  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle" },
    init = function()
      require("user.config.overseer").init()
    end,
    config = function()
      require("user.config.overseer").config()
    end,
  },

  {
    "stevearc/aerial.nvim",
    event = "BufRead",
    cmd = "Aerial",
    init = function()
      require("user.config.aerial").setup()
    end,
    config = function()
      require("user.config.aerial").config()
    end,
  },

  {
    "akinsho/toggleterm.nvim",

    cmd = { "ToggleTerm", "ToggleTermOpen" },
    init = function()
      require("user.config.toggleterm").setup()
    end,
    config = function()
      require("user.config.toggleterm").config()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "BufRead",
    cmd = "GitSigns",
    init = function()
      require("user.config.gitsigns").setup()
    end,
    config = function()
      require("user.config.gitsigns").config()
    end,
  },
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    config = function()
      require("neogit").setup {
        enhanced_diff_hl = true,
        integrations = {
          diffview = true,
        },
        signs = {
          section = { "", "" },
          item = { "", "" },
        },
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    cmd = { "DiffviewOpen" },
  },

  {
    "windwp/nvim-spectre",
    init = function()
      require("user.config.spectre").setup()
    end,
    config = function()
      require("user.config.spectre").config()
    end,
  },

  {
    "matbme/JABS.nvim",
    cmd = "JABSOpen",
    init = function()
      require("user.config.jabs").setup()
    end,
    config = function()
      require("user.config.jabs").config()
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = { "BufRead" },
    init = function()
      require("user.config.hlslens").setup()
    end,
    config = function()
      require("user.config.hlslens").config()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    cond = function()
      return vim.fn.executable "node" == 1
    end,
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
}
