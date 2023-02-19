return {
  { "rebelot/kanagawa.nvim", lazy = false },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require "user.config.dressing"
    end,
  },
  {
    "feline-nvim/feline.nvim",
    lazy = false,
    config = function()
      require "user.config.feline"
    end,
  },
  {
    "lewis6991/satellite.nvim",
    event = { "BufRead", "InsertEnter" },
    config = function()
      require("satellite").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufRead" },
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        char = "▏",
        context_char = "▏",
      }
    end,
  },

  {
    "eandrju/cellular-automaton.nvim",
    cmd = { "CellularAutomaton" },
  },

  {
    "delphinus/cellwidths.nvim",
    event = { "BufRead" },
    config = function()
      require "user.config.cellwidths"
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufRead", "InsertEnter" },
    config = function()
      require("illuminate").configure {
        providers = {
          "treesitter",
          "lsp",
          "regex",
        },
        filetypes_denylist = {
          "neo-tree",
        },
      }
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("statuscol").setup {
            foldfunc = "builtin",
            setopt = true,
          }
        end,
      },
    },
    init = function()
      require("user.config.ufo").init()
    end,
    config = function()
      require("user.config.ufo").config()
    end,
  },
}
