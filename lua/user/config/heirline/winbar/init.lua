local conditions = require "heirline.conditions"

local lrequire = require("user.config.heirline.utils").require

local Winbar = {
  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,
  fallthrough = false,

  lrequire "winbar.explorer",
  lrequire "winbar.default",
}

return Winbar
