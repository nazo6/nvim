local Bar = require "nougat.bar"
local Item = require "nougat.item"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local color = c.color

local wbr = Bar("winbar", {})

wbr:add_item(Item {
  content = "       ",
  hl = { fg = color.blue, bg = color.bg2 },
  sep_right = sep.right_lower_triangle_solid(true),
})

return wbr
