local statusbar = require "config.plugin.feline.statusbar"
local winbar = require "config.plugin.feline.winbar"

local theme = require("kanagawa.colors").setup()

require("feline").winbar.setup {
  components = winbar.default,
  conditional_components = {
    winbar.explorer,
  },
  theme = theme,
}

theme.bg = theme.sumiInk0

require("feline").setup {
  components = statusbar.default,
  conditional_components = {
    statusbar.explorer,
  },
  theme = theme,
}
