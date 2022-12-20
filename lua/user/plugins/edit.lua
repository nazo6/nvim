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
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      {
        "zbirenbaum/copilot-cmp",
        after = { "nvim-cmp" },
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
    "phaazon/hop.nvim",
    cmd = "Hop",
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
      require "user.config.surround"
    end,
  }
end
