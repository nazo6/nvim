return function(use)
  use { "rebelot/kanagawa.nvim", lazy = false }
  use {
    "stevearc/dressing.nvim",
    config = function()
      require "user.config.dressing"
    end,
  }
  use {
    "feline-nvim/feline.nvim",
    lazy = false,
    config = function()
      require "user.config.feline"
    end,
  }
  use {
    "petertriho/nvim-scrollbar",
    event = { "BufRead" },
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
    end,
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufRead" },
    config = function()
      require "user.config.indent-blankline"
    end,
  }

  use {
    "eandrju/cellular-automaton.nvim",
    cmd = { "CellularAutomaton" },
  }

  use {
    "delphinus/cellwidths.nvim",
    event = { "BufRead" },
    config = function()
      require "user.config.cellwidths"
    end,
  }

  --[[
  use {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "kevinhwang91/promise-async", ,
    },
    event = { "BufRead" },
    config = function()
      require("ufo").setup()
    end,
  }
  ]]
end
