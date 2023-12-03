local core = require "nougat.core"
local Bar = require "nougat.bar"
local Item = require "nougat.item"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local color = c.color
local stl = Bar "statusline"

stl:add_item(nut.mode {})
stl:add_item(nut.git.branch {
  hl = { bg = color.magenta, fg = color.bg },
  prefix = "  ",
  suffix = " ",
  sep_right = sep.right_upper_triangle_solid(true),
})
stl:add_item(nut.git.status.create {
  hl = { fg = color.bg },
  content = {
    nut.git.status.count("added", {
      hl = { bg = color.green },
      prefix = "+",
      sep_right = sep.right_upper_triangle_solid(true),
    }),
    nut.git.status.count("changed", {
      hl = { bg = color.blue },
      prefix = "~",
      sep_right = sep.right_upper_triangle_solid(true),
    }),
    nut.git.status.count("removed", {
      hl = { bg = color.red },
      prefix = "-",
      sep_right = sep.right_upper_triangle_solid(true),
    }),
  },
})
stl:add_item(nut.buf.diagnostic_count {
  prefix = " ",
  suffix = " ",
  config = {
    error = { prefix = " " },
    warn = { prefix = " " },
    info = { prefix = " " },
    hint = { prefix = "󰌶 " },
  },
})
stl:add_item(nut.spacer())
stl:add_item(nut.truncation_point())
stl:add_item(Item {
  hl = { bg = color.bg2, fg = color.blue },
  sep_left = sep.left_lower_triangle_solid(true),
  content = core.group {
    core.code "l",
    ":",
    core.code "c",
  },
  suffix = " ",
})

return stl
