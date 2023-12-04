local Bar = require "nougat.bar"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local color = c.color

local wbr = Bar "winbar"

wbr:add_item(nut.buf.icon {
  hl = { bg = color.bg2 },
  prefix = " ",
  priority = 30,
})
wbr:add_item(nut.buf.filename {
  hl = { bg = color.bg2 },
  prefix = " ",
  suffix = " ",
  priority = 30,
})
wbr:add_item(nut.buf.filestatus {
  hl = { bg = color.bg2 },
  suffix = " ",
  sep_right = sep.right_lower_triangle_solid(true),
  config = {
    modified = "󰏫",
    nomodifiable = "󰏯",
    readonly = "",
    sep = " ",
  },
})
wbr:add_item(nut.buf.navic {
  prefix = " ",
  suffix = " ",
})

return wbr
