local Bar = require "nougat.bar"
local Item = require "nougat.item"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local color = c.color

local wbr_active = Bar("winbar", {})
wbr_active:add_item(Item {
  content = "       ",
  hl = { fg = color.blue, bg = color.bg2 },
  sep_right = sep.right_lower_triangle_solid(true),
})

local wbr_inactive = Bar("winbar", {})
wbr_inactive:add_item(Item {
  content = "       ",
  hl = { fg = color.blue },
})

---@param ctx nougat_core_expression_context
return function(ctx)
  if ctx.is_focused then
    return wbr_active
  else
    return wbr_inactive
  end
end
