local Item = require "nougat.item"

local function prepare(item, ctx) end

local function content(item, ctx)
  if package.loaded["nvim-navic"] then
    local navic = require "nvim-navic"
    if navic.is_available() then
      local location = navic.get_location()
      return location
    end
  end
  return ""
end

local mod = {}

function mod.create(opts)
  local item = Item {
    priority = opts.priority,
    prepare = prepare,
    hidden = opts.hidden,
    hl = opts.hl,
    sep_left = opts.sep_left,
    prefix = opts.prefix,
    content = content,
    suffix = opts.suffix,
    sep_right = opts.sep_right,
    on_click = opts.on_click,
    context = opts.context,
  }

  return item
end

return mod
