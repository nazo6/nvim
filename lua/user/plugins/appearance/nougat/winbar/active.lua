local Bar = require "nougat.bar"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local color = c.color

local wbr = Bar("winbar", {
  hl = { bg = color.palette.winterRed, fg = color.palette.fujiWhite },
})

wbr:add_item(nut.buf.icon {
  hl = { bg = color.palette.waveRed },
  prefix = " ",
})
wbr:add_item(nut.buf.filename {
  hl = { bg = color.palette.waveRed, fg = "white" },
  prefix = " ",
  suffix = " ",
})
wbr:add_item(nut.buf.filestatus {
  hl = { bg = color.palette.waveRed, fg = "white" },
  suffix = " ",
  sep_right = sep.right_lower_triangle_solid(true),
  config = {
    modified = "●",
    nomodifiable = "󰏯",
    readonly = "",
    sep = " ",
  },
})
wbr:add_item(nut.buf.navic {
  prefix = " ",
  suffix = " ",
  priority = -1,
})

return wbr
