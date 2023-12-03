local Bar = require "nougat.bar"

local c = require "user.plugins.appearance.nougat.common"
local color = c.color

local stl = Bar("statusline", {
  hl = { bg = color.bg },
})

return stl
