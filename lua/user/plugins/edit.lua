return function(use)
  use {
    "L3MON4D3/LuaSnip",
    requires = {
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      require "user.config.luasnip"
    end,
    event = "InsertEnter",
  }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-calc", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
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
    cmd = "Hop*",
    setup = function()
      require("user.config.hop").setup()
    end,
    config = function()
      require("user.config.hop").config()
    end,
  }
  use {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    after = { "nvim-cmp" },
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
    module = { "mini" },
    config = function()
      require "user.config.mini"
    end,
  }
  use {
    "kylechui/nvim-surround",
    config = function()
      require "user.config.surround"
    end,
  }

  use {
    "vim-skk/skkeleton",
    event = { "BufRead", "InsertEnter" },
    requires = {
      { "vim-denops/denops.vim", event = { "BufRead", "InsertEnter" } },
    },
    config = function()
      require "user.config.skkeleton"
    end,
  }
end
