local lrequire = require("user.config.heirline.utils").lrequire

local Statusline = {
  fallthrough = false,

  lrequire "statusline.explorer",
  lrequire "statusline.default",
}

return Statusline
