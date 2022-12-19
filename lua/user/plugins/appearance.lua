return function(use)
  use "rebelot/kanagawa.nvim"
  use("stevearc/dressing.nvim", {
    lua_source = [[require "user.config.dressing"]],
  })
  use("feline-nvim/feline.nvim", {
    lua_source = [[require "user.config.feline"]],
  })
  use("petertriho/nvim-scrollbar", {
    on_event = { "BufRead" },
    lua_source = [[
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
    ]],
  })
  use("lukas-reineke/indent-blankline.nvim", {
    on_event = { "BufRead" },
    lua_source = [[require "user.config.indent-blankline"]],
  })

  use("eandrju/cellular-automaton.nvim", {
    on_cmd = { "CellularAutomaton" },
    on_lua = "cellular-automaton",
  })

  use("delphinus/cellwidths.nvim", {
    on_event = { "BufRead" },
    lua_source = [[require "user.config.cellwidths"]],
  })

  --[[
  use (
    "kevinhwang91/nvim-ufo",
    requires = {
      { "kevinhwang91/promise-async", module = { "promise-async", "promise", "async" } },
    },
    event = { "BufRead" },
    config = function()
      require("ufo").setup()
    end,
  )
  ]]
end
