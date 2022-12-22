return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",

    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "jvgrootveld/telescope-zoxide" },
    },
    init = function()
      require("user.config.telescope").setup()
    end,
    config = function()
      require("user.config.telescope").config()
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { { "kyazdani42/nvim-web-devicons" } },
    cmd = { "NvimTreeToggle" },
    init = function()
      require("user.config.nvim-tree").setup()
    end,
    config = function()
      require("user.config.nvim-tree").config()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-lua/plenary.nvim" },
      { "MunifTanjim/nui.nvim" },
      {
        "s1n7ax/nvim-window-picker",

        config = function()
          require "user.config.window-picker"
        end,
      },
    },
    cmd = { "Neotree" },
    init = function()
      require("user.config.neo-tree").setup()
    end,
    config = function()
      require("user.config.neo-tree").config()
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { { "kyazdani42/nvim-web-devicons" } },
    cmd = { "Trouble", "TroubleToggle" },
    init = function()
      require("user.config.trouble").setup()
    end,
    config = function()
      require("user.config.trouble").config()
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
    config = function()
      require("gitsigns").setup()
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
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },

  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick" },
  },

  --[[
{
    "ldelossa/nvim-ide",
    cmd = { "Workspace" },
    init = function()
      require("user.config.ide").setup()
    end,
    config = function()
      require("user.config.ide").config()
    end,
},
  ]]
}
