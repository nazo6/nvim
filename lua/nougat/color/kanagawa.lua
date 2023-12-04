local mod = {}

function mod.get()
  ---@class nougat.color
  ---@field palette PaletteColors
  local color = { palette = _G.color_palette }
  -- set the values here
  return color
end

return mod
