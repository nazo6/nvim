return {
  { "rebelot/kanagawa.nvim", lazy = false },
  {
    "stevearc/dressing.nvim",
    lazy = false,
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
    "petertriho/nvim-scrollbar",
    event = { "BufRead" },
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
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

  --[[
{
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "kevinhwang91/promise-async", ,
    },
    event = { "BufRead" },
    config = function()
      require("ufo").setup()
    end,
},
  ]]
}
