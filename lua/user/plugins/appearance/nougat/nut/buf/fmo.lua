local Item = require "nougat.item"

local function prepare(item, ctx)
  local cache = item:cache(ctx)
  if not cache.formatters then
    if package.loaded["fmo"] ~= nil then
      cache.formatters = require("fmo").get_formatters(0)
    end
  end
end

local function content(item, ctx)
  local formatters = item:cache(ctx).formatters
  if formatters ~= nil and #formatters > 0 then
    local str = ""
    for _, formatter in ipairs(formatters) do
      str = str .. formatter.type .. ":" .. formatter.name .. " "
    end
    return str
  end
  return nil
end

local cache_initial_value = { formatters = nil }

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
    cache = {
      name = "nnut.buf.fmo",
      scope = "buf",
      get = function(store, ctx)
        return store[ctx.bufnr]
      end,
      initial_value = cache_initial_value,
      clear = "LspAttach",
    },
  }

  return item
end

return mod
