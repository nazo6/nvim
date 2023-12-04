local Item = require "nougat.item"

local mod = {}

local function prepare(item, ctx)
  local cache = item:cache(ctx)
  if not cache.encoding then
    local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
    cache.encoding = enc:upper()
  end
end

local function content(item, ctx)
  return item:cache(ctx).encoding
end

local cache_initial_value = { encoding = nil }

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
      name = "nnut.buf.encoding",
      scope = "buf",
      get = function(store, ctx)
        return store[ctx.bufnr]
      end,
      initial_value = cache_initial_value,
      clear = "BufWritePost",
    },
  }

  return item
end

return mod
