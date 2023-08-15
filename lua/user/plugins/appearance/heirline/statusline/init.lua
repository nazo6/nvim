local Statusline = {
  hl = "StatusLine",
  fallthrough = false,

  require "user.plugins.appearance.heirline.statusline.explorer",
  require "user.plugins.appearance.heirline.statusline.default",
}

return Statusline
