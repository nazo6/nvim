local lrequire = require("user.config.heirline.utils").lrequire

local Statusline = {
  hl = "StatusLine",
  fallthrough = false,

  lrequire "statusline.explorer",
  lrequire "statusline.default",
}

return Statusline
