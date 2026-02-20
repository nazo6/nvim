local Bar = require "nougat.bar"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local colors = require("user.config.colors").get()

local wbr = Bar("winbar", {
  hl = colors.winbar.active.other,
})

wbr:add_item(nut.buf.icon {
  hl = { bg = colors.winbar.active.title.bg },
  prefix = " ",
})
wbr:add_item(nut.buf.filename {
  hl = colors.winbar.active.title,
  prefix = " ",
  suffix = " ",
})
wbr:add_item(nut.buf.filestatus {
  hl = colors.winbar.active.title,
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
