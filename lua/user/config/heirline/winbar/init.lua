local lrequire = require("user.config.heirline.utils").lrequire

local Winbar = {
  fallthrough = false,

  lrequire "winbar.floating",
  lrequire "winbar.explorer",
  lrequire "winbar.default",
}

return Winbar
