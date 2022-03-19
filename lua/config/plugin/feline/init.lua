local default = require "config.plugin.feline.default"
local explorer = require "config.plugin.feline.explorer"

local theme = require("kanagawa.colors").setup()
-- theme.bg = theme.sumiInk2

require("feline").setup {
  components = default,
  conditional_components = {
    explorer,
  },
  theme = theme,
}
