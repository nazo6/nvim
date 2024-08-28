local Bar = require "nougat.bar"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local color = c.color

local wbr = Bar("winbar", {
  hl = { bg = color.palette.sumiInk4 },
})

wbr:add_item(nut.buf.icon {
  hl = { bg = color.bg },
  prefix = " ",
})
wbr:add_item(nut.buf.filename {
  hl = { bg = color.bg },
  prefix = " ",
  suffix = " ",
})
wbr:add_item(nut.buf.filestatus {
  hl = { bg = color.bg },
  suffix = " ",
  sep_right = sep.right_lower_triangle_solid(true),
  config = {
    modified = "󰏫",
    nomodifiable = "󰏯",
    readonly = "",
    sep = " ",
  },
})

return wbr
