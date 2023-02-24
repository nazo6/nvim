local conditions = require "heirline.conditions"
local colors = require("user.config.heirline.utils").colors
local separators = require("user.config.heirline.utils").separators

local hl = {
  explorer_icon = { bg = colors.sumiInk2 },
  explorer_icon_sep = { fg = colors.sumiInk2, bg = colors.sumiInk4 },
  bg = { bg = colors.sumiInk4 },
}

local ExplorerIcon = {
  {
    provider = "   ",
    hl = hl.explorer_icon,
  },
  {
    provider = separators.slant_right,
    hl = hl.explorer_icon_sep,
  },
}

local Align = {
  provider = "%=",
}

local ExplorerWinbar = {
  { ExplorerIcon, Align },
  hl = hl.bg,
  condition = function()
    return conditions.buffer_matches {
      filetype = { "neo%-tree" },
    }
  end,
}

return ExplorerWinbar
