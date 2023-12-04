local Item = require "nougat.item"

local buffer_cache = require "nougat.cache.buffer"
local buffer_cache_store = buffer_cache.store

buffer_cache.enable "filetype"

local function prepare(item, ctx) end

local function content(item, ctx)
  local cache = buffer_cache_store[ctx.bufnr]
  local ft = cache.filetype
  if ft == "" or ft == nil then
    ft = "-"
  end
  return ft
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
