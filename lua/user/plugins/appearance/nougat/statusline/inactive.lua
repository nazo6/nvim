local Bar = require "nougat.bar"
local sep = require "nougat.separator"

local c = require "user.plugins.appearance.nougat.common"
local nut = c.nut
local color = c.color

local stl_inactive = Bar "statusline"
do
  stl_inactive:add_item(nut.spacer())
end

return stl_inactive
