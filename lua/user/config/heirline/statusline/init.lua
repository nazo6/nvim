local Statusline = {
  hl = "StatusLine",
  fallthrough = false,

  require "user.config.heirline.statusline.explorer",
  require "user.config.heirline.statusline.default",
}

return Statusline
