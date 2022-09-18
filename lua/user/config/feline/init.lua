local statusbar = require "user.config.feline.statusbar"
local winbar = require "user.config.feline.winbar"

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
  force_inactive = {},
  theme = theme,
  vi_mode_colors = {
    ["NORMAL"] = "green",
    ["OP"] = "green",
    ["INSERT"] = "red",
    ["VISUAL"] = "skyblue",
    ["LINES"] = "skyblue",
    ["BLOCK"] = "skyblue",
    ["REPLACE"] = "violet",
    ["V-REPLACE"] = "violet",
    ["ENTER"] = "cyan",
    ["MORE"] = "cyan",
    ["SELECT"] = "orange",
    ["COMMAND"] = "green",
    ["SHELL"] = "green",
    ["TERM"] = "red",
    ["NONE"] = "yellow",
  },
}
