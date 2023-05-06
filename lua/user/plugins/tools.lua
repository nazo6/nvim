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
    },
    init = function()
      require("user.config.neo-tree").setup()
    end,
    config = function()
      require("user.config.neo-tree").config()
    end,
  },

  {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup {
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          bo = {
            filetype = { "NvimTree", "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
        other_win_hl_color = "#e35e4f",
      }
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    cmd = { "NvimTreeToggle" },
    init = function()
      require("user.config.nvim-tree").setup()
    end,
    config = function()
      require("user.config.nvim-tree").config()
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
    event = "InsertEnter",
    config = function()
      require("user.config.copilot").config()
    end,
  },

  {
    "ActivityWatch/aw-watcher-vim",
    init = function()
      if vim.g.plugin_enabled["aw-watcher-vim"] == false then
        return
      end

      vim.api.nvim_create_autocmd({ "BufReadPre", "InsertEnter" }, {
        group = vim.api.nvim_create_augroup("setup-aw", {}),
        once = true,
        callback = function()
          vim.g.aw_apiurl_host = require("user.utils").get_host()
          require("lazy").load { plugins = { "aw-watcher-vim" } }
          vim.cmd [[silent AWStart]]
        end,
      })
    end,
  },
}
