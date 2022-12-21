return function(use)
  use {
    "L3MON4D3/LuaSnip",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      require "user.config.luasnip"
    end,
    event = "InsertEnter",
  }
  use {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-calc" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol" },
      { "saadparwaiz1/cmp_luasnip" },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    cmd = { "CmpStatus" },
    config = function()
      require "user.config.cmp"
    end,
  }

  use {
    "hrsh7th/nvim-gtd",
    event = { "WinNew" },
    init = function()
      vim.keymap.set("n", "gf", function()
        require("gtd").exec { command = "edit" }
      end)
    end,
    config = function()
      require("gtd").setup()
    end,
  }

  use {
    "phaazon/hop.nvim",
    cmd = {
      "HopWord",
      "HopChar1CurrentLineAC",
      "HopChar1CurrentLineBC",
    },
    init = function()
      require("user.config.hop").setup()
    end,
    config = function()
      require("user.config.hop").config()
    end,
  }
  use {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      require("nvim-autopairs").setup {
        enable_check_bracket_line = false,
      }
    end,
  }
  use {
    "abecodes/tabout.nvim",
    event = { "InsertEnter" },
    config = function()
      require "user.config.tabout"
    end,
  }
  use {
    "echasnovski/mini.nvim",
    event = { "BufRead" },
    config = function()
      require "user.config.mini"
    end,
  }
  use {
    "kylechui/nvim-surround",
    event = { "BufRead", "InsertEnter" },
    config = function()
      require("nvim-surround").setup {}
    end,
  }
  use {
    "folke/todo-comments.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    event = { "BufRead" },
    config = function()
      require("todo-comments").setup {}
    end,
  }
end
