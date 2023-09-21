return {
  {
    "echasnovski/mini.clue",
    keys = { "<leader>" },
    config = function()
      local miniclue = require "mini.clue"
      miniclue.setup {
        triggers = {
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
        },
        window = {
          delay = 200,
          config = {
            width = "auto",
          },
        },
      }
    end,
  },
}
