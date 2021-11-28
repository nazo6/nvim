local hl = {
  Active = { "ActiveFg", "ActiveBg" },
  Inactive = { "InactiveFg", "InactiveBg" },
}

local M = {}

M.create_sections = function(section) end

M.create_section = function(components, active)
  local bg = "ActiveBg"
  if not active then
    bg = "InactiveBg"
  end
  local first = { " ", components[0][1][0], bg }
  local last = { " ", components[#components - 1][1][0], bg }

  local section = { first }
end

return M
