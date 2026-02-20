local M = {}

---@class Color
---@field fg? string
---@field bg? string

---@class Colors
---@field winbar ColorsWinbar

---@class ColorsWinbar
---@field active ColorsWinbarActive
---@field inactive ColorsWinbarActive

---@class ColorsWinbarActive
---@field title Color
---@field other Color

---@class ColorsWinbarInactive
---@field title Color
---@field other Color

---@type Colors|nil
local store = nil

---@param colors Colors
M.set = function(colors)
  store = colors
end

M.get = function()
  if not store then
    error "Colors not set"
  else
    return store
  end
end

return M
