local conditions = require "heirline.conditions"
local colors = require("user.plugins.appearance.heirline.utils").colors
local separators = require("user.plugins.appearance.heirline.utils").separators

local hl = {
  bg = { bg = colors.sumiInk2 },
}

-- local Text = {
--   provider = "neo-tree",
-- }

local Align = {
  provider = "%=",
}

local ExplorerStatusline = {
  { Align },
  hl = hl.bg,
  condition = function()
    return conditions.buffer_matches {
      filetype = { "neo%-tree", "NvimTree" },
    }
  end,
}

return ExplorerStatusline
