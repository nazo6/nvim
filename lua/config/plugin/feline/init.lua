local statusbar = require "config.plugin.feline.statusbar"
local winbar = require "config.plugin.feline.winbar"

local theme = require("kanagawa.colors").setup()
-- theme.bg = theme.sumiInk2

require("feline").setup {
  components = statusbar.default,
  conditional_components = {
    statusbar.explorer,
  },
  theme = theme,
}

require("feline").winbar.setup {
  components = winbar.default,
  conditional_components = {
    winbar.explorer,
  },
  theme = theme,
}
