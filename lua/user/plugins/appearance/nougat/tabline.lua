local Bar = require "nougat.bar"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local color = c.color

local tal = Bar "tabline"
tal:add_item(nut.tab.tablist.tabs {
  active_tab = {
    hl = { bg = color.bg, fg = color.blue },
    prefix = " ",
    suffix = " ",
    content = {
      nut.tab.tablist.icon { suffix = " " },
      nut.tab.tablist.label {},
      nut.tab.tablist.modified { prefix = " ", config = { text = "●" } },
      nut.tab.tablist.close { prefix = " ", config = { text = "󰅖" } },
    },
  },
  inactive_tab = {
    hl = { bg = color.bg2, fg = color.fg2 },
    prefix = " ",
    suffix = " ",
    content = {
      nut.tab.tablist.icon { suffix = " " },
      nut.tab.tablist.label {},
      nut.tab.tablist.modified { prefix = " ", config = { text = "●" } },
      nut.tab.tablist.close { prefix = " ", config = { text = "󰅖" } },
    },
  },
})

return tal
