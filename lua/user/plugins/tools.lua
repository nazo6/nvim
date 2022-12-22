return function(use)
  use {
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
  }

  use {
    "kyazdani42/nvim-tree.lua",
    dependencies = { { "kyazdani42/nvim-web-devicons" } },
    cmd = { "NvimTreeToggle" },
    init = function()
      require("user.config.nvim-tree").setup()
    end,
    config = function()
      require("user.config.nvim-tree").config()
    end,
  }
  use {
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
  }

  use {
    "folke/trouble.nvim",
    dependencies = { { "kyazdani42/nvim-web-devicons" } },
    cmd = { "Trouble", "TroubleToggle" },
    init = function()
      require("user.config.trouble").setup()
    end,
    config = function()
      require("user.config.trouble").config()
    end,
  }
  use {
    "stevearc/aerial.nvim",
    event = "BufRead",
    cmd = "Aerial",
    init = function()
      require("user.config.aerial").setup()
    end,
    config = function()
      require("user.config.aerial").config()
    end,
  }
  use {
    "akinsho/toggleterm.nvim",

    cmd = { "ToggleTerm", "ToggleTermOpen" },
    init = function()
      require("user.config.toggleterm").setup()
    end,
    config = function()
      require("user.config.toggleterm").config()
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
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
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    cmd = { "DiffviewOpen" },
  }

  use {
    "windwp/nvim-spectre",
    init = function()
      require("user.config.spectre").setup()
    end,
    config = function()
      require("user.config.spectre").config()
    end,
  }

  use {
    "matbme/JABS.nvim",
    cmd = "JABSOpen",
    init = function()
      require("user.config.jabs").setup()
    end,
    config = function()
      require("user.config.jabs").config()
    end,
  }

  use {
    "kevinhwang91/nvim-hlslens",
    event = { "BufRead" },
    init = function()
      require("user.config.hlslens").setup()
    end,
    config = function()
      require("user.config.hlslens").config()
    end,
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

  --[[
  use {
    "ldelossa/nvim-ide",
    cmd = { "Workspace" },
    init = function()
      require("user.config.ide").setup()
    end,
    config = function()
      require("user.config.ide").config()
    end,
  }
  ]]
end
