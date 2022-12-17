return function(use)
  use "rebelot/kanagawa.nvim"
  use {
    "stevearc/dressing.nvim",
    config = function()
      require "user.config.dressing"
    end,
  }
  use {
    "feline-nvim/feline.nvim",
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
    module = "cellular-automaton",
  }

  use {
    "delphinus/cellwidths.nvim",
    event = { "BufRead" },
    config = function()
      require("cellwidths").setup {
        name = "default",
      }
    end,
  }

  --[[
  use {
    "kevinhwang91/nvim-ufo",
    requires = {
      { "kevinhwang91/promise-async", module = { "promise-async", "promise", "async" } },
    },
    event = { "BufRead" },
    config = function()
      require("ufo").setup()
    end,
  }
  ]]
end
