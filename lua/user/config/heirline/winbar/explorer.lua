local conditions = require "heirline.conditions"

local ExplorerIcon = {
  provider = " ",
}

local ExplorerWinbar = {
  condition = function()
    return conditions.buffer_matches {
      filetype = { "neo-tree" },
    }
  end,
}

return ExplorerWinbar
