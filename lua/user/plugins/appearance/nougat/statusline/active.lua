local core = require "nougat.core"
local Bar = require "nougat.bar"
local Item = require "nougat.item"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local color = c.color
local stl = Bar "statusline"

stl:add_item(nut.mode {})
stl:add_item(nut.buf.filetype {
  hl = { bg = color.bg2, fg = "white" },
  prefix = " ",
  suffix = " ",
})
stl:add_item(nut.buf.fileformat {
  hl = { bg = color.bg2, fg = "white" },
  sep_left = {
    content = c.separators.vertical_bar,
    hl = { bg = -1, fg = color.bg4 },
  },
  prefix = " ",
  suffix = " ",
})
stl:add_item(nut.buf.encoding {
  hl = { bg = color.bg2, fg = "white" },
  sep_left = {
    content = c.separators.vertical_bar,
    hl = { bg = -1, fg = color.bg4 },
  },
  sep_right = sep.right_lower_triangle_solid(true),
  prefix = " ",
  suffix = " ",
})
stl:add_item(nut.buf.diagnostic_count {
  prefix = " ",
  suffix = " ",
  hl = { bg = color.bg },
  config = {
    error = { prefix = " " },
    warn = { prefix = " " },
    info = { prefix = " " },
    hint = { prefix = "󰌶 " },
  },
  -- sep_right = sep.right_lower_triangle_solid(true),
})
stl:add_item(nut.lsp.servers {
  hl = { fg = color.fg },
  prefix = "  ",
  config = {
    content = function(client)
      if client.name ~= "copilot" then
        return client.name
      end
    end,
  },
})
stl:add_item(nut.buf.fmo {
  hl = { fg = color.fg },
  prefix = "  ",
})

stl:add_item(nut.buf.copilot {
  prefix = " ",
  hl = { fg = color.fg },
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
  sep_left = sep.left_lower_triangle_solid(true),
})
stl:add_item(nut.git.branch {
  hl = { bg = color.green, fg = color.bg2 },
  prefix = "  ",
  suffix = " ",
  hidden = function(_, ctx)
    return ctx.branch == ""
  end,
  sep_left = sep.left_lower_triangle_solid(true),
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
