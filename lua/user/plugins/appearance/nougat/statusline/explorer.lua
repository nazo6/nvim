local core = require "nougat.core"
local Bar = require "nougat.bar"
local Item = require "nougat.item"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local color = c.color
local stl = Bar "statusline"

stl:add_item(nut.mode {})
stl:add_item(Item {
  hl = { bg = color.bg2, fg = "white" },
  content = vim.fn.getcwd(0, 0),
  prefix = " ",
  suffix = " ",
  sep_right = sep.right_lower_triangle_solid(true),
})

stl:add_item(nut.spacer())
stl:add_item(nut.truncation_point())

stl:add_item(nut.git.status {
  hl = { bg = color.bg2 },
  added_hl = { fg = color.green },
  added_prefix = " +",
  changed_prefix = " ~",
  removed_prefix = " -",
  changed_hl = { fg = color.blue },
  removed_hl = { fg = color.red },
  suffix = " ",
  -- sep_left = sep.left_lower_triangle_solid(true),
})
stl:add_item(nut.git.branch {
  hl = { bg = color.green, fg = color.bg2 },
  prefix = "  ",
  suffix = " ",
  hidden = function(_, ctx)
    return ctx.branch == ""
  end,
  sep_left = sep.left_lower_triangle_solid(true),
  global = true,
})

stl:add_item(Item {
  hl = { bg = color.bg2, fg = color.blue },
  sep_left = sep.left_lower_triangle_solid(true),
  content = core.group {
    core.code("l", { min_width = 2 }),
    ":",
    core.code("c", { min_width = 2 }),
  },
  prefix = " ",
  suffix = " ",
})

return stl
