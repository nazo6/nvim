local default = require "rc.feline.default"
local explorer = require "rc.feline.explorer"

local theme = require("kanagawa.colors").setup()
-- theme.bg = theme.sumiInk2

require("feline").setup {
  components = default,
  conditional_components = {
    explorer,
  },
  theme = theme,
}
