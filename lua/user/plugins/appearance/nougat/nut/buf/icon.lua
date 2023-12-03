local Item = require "nougat.item"
local buf_cache = require "nougat.cache.buffer"

local has_devicons, devicons = pcall(require, "nvim-web-devicons")

buf_cache.enable "filetype"

local filetype_overide = {
  fugitive = "git",
  gitcommit = "git",
}

local function prepare(item, ctx)
  local filetype = buf_cache.get("filetype", ctx.bufnr) or ""
  local cache = item:cache(ctx)
  if not cache.c then
    local ft = filetype_overide[filetype] or filetype
    cache.c, cache.hl.fg = devicons.get_icon_color_by_filetype(ft, { default = true })
  end
end

local function content(item, ctx)
  return item:cache(ctx).c
end

local cache_initial_value = { c = nil, hl = {} }

local mod = {}

function mod.create(opts)
  local item = Item {
    priority = opts.priority,
    prepare = prepare,
    hidden = opts.hidden,
    hl = function(item, ctx)
      return { fg = item:cache(ctx).hl.fg, bg = opts.hl.bg }
    end,

    sep_left = opts.sep_left,
    prefix = opts.prefix,
    content = content,
    suffix = opts.suffix,
    sep_right = opts.sep_right,
    on_click = opts.on_click,
    context = opts.context,
    cache = {
      name = "nnut.buf.icon",
      scope = "buf",
      get = function(store, ctx)
        return store[ctx.bufnr]
      end,
      initial_value = cache_initial_value,
      clear = "BufFilePost",
    },
  }

  if not has_devicons then
    item.hidden = true
  end

  return item
end

return mod
