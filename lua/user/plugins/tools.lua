return function(use)
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    requires = {
      { "nvim-lua/plenary.nvim", module = "plenary" },
    },
    setup = function()
      require("user.config.telescope").setup()
    end,
    config = function()
      require("user.config.telescope").config()
    end,
  }

  use {
    "jvgrootveld/telescope-zoxide",
    opt = true,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = { { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" } },
    cmd = { "NvimTree*" },
    setup = function()
      require("user.config.nvim-tree").setup()
    end,
    config = function()
      require("user.config.nvim-tree").config()
    end,
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
      { "nvim-lua/plenary.nvim", module = "plenary" },
      { "MunifTanjim/nui.nvim", module = "nui" },
      {
        "s1n7ax/nvim-window-picker",
        tag = "1.*",
        module = "window-picker",
        config = function()
          require "user.config.window-picker"
        end,
      },
    },
    cmd = { "Neotree" },
    setup = function()
      require("user.config.neo-tree").setup()
    end,
    config = function()
      require("user.config.neo-tree").config()
    end,
  }

  use {
    "folke/trouble.nvim",
    requires = { { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" } },
    cmd = "Trouble*",
    setup = function()
      require("user.config.trouble").setup()
    end,
    config = function()
      require("user.config.trouble").config()
    end,
  }
  use {
    "stevearc/aerial.nvim",
    event = "BufRead",
    cmd = "Aerial*",
    setup = function()
      require("user.config.aerial").setup()
    end,
    config = function()
      require("user.config.aerial").config()
    end,
  }
  use {
    "akinsho/toggleterm.nvim",
    module = "toggleterm",
    cmd = { "ToggleTerm", "ToggleTerm*" },
    setup = function()
      require("user.config.toggleterm").setup()
    end,
    config = function()
      require("user.config.toggleterm").config()
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      { "nvim-lua/plenary.nvim", module = "plenary" },
    },
    event = "BufRead",
    cmd = "GitSigns",
    config = function()
      require("gitsigns").setup()
    end,
  }
  use {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    module = { "neogit" },
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
  }
  use {
    "sindrets/diffview.nvim",
    requires = {
      { "nvim-lua/plenary.nvim", module = "plenary" },
    },
    cmd = { "DiffviewOpen" },
    module = "diffview",
  }

  use {
    "windwp/nvim-spectre",
    module = { "spectre" },
    setup = function()
      require("user.config.spectre").setup()
    end,
    config = function()
      require("user.config.spectre").config()
    end,
  }

  use {
    "matbme/JABS.nvim",
    cmd = "JABSOpen",
    setup = function()
      require("user.config.jabs").setup()
    end,
    config = function()
      require("user.config.jabs").config()
    end,
  }

  use {
    "kevinhwang91/nvim-hlslens",
    event = { "BufRead" },
    setup = function()
      require("user.config.hlslens").setup()
    end,
    config = function()
      require("user.config.hlslens").config()
    end,
    module = { "hlslens" },
  }

  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }

  use {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick" },
  }
end
