local Item = require "nougat.item"

local content = function(_, ctx)
  return ctx.branch
end

local mod = {}

function mod.create(opts)
  local item = Item {
    priority = opts.priority,
    hidden = opts.hidden,
    hl = opts.hl,
    sep_left = opts.sep_left,
    prefix = opts.prefix,
    content = content,
    prepare = function(_, ctx)
      if opts.global then
        ctx.branch = vim.g.gitsigns_head or ""
      else
        ctx.branch = vim.b.gitsigns_head or ""
      end
    end,
    suffix = opts.suffix,
    sep_right = opts.sep_right,
    on_click = opts.on_click,
    context = opts.context,
    cache = {
      scope = "buf",
      clear = "BufModifiedSet",
    },
  }

  return item
end

return mod
