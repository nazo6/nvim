return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "user.config.colors"
    end,
  },
  {
    "stevearc/dressing.nvim",
    init = function()
      require("user.config.dressing").init()
    end,
    config = function()
      require("user.config.dressing").config()
    end,
  },
  {
    "rebelot/heirline.nvim",
    lazy = false,
    config = function()
      require "user.config.heirline"
    end,
  },
  {
    "lewis6991/satellite.nvim",
    event = { "BufRead", "InsertEnter", "BufNewFile" },
    config = function()
      require("satellite").setup {
        handlers = {
          gitsigns = {
            enable = false,
          },
        },
      }
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

  -- {
  --   "delphinus/cellwidths.nvim",
  --   event = { "BufRead" },
  --   config = function()
  --     require "user.config.cellwidths"
  --   end,
  -- },

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
          "NvimTree",
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
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
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

  -- {
  --   "goolord/alpha-nvim",
  --   requires = { "nvim-tree/nvim-web-devicons" },
  --   lazy = false,
  --   config = function()
  --     require "user.config.alpha"
  --   end,
  -- },
}
