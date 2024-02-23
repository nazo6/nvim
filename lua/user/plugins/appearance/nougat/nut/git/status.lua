local Item = require "nougat.item"

local prepare = function(_, ctx)
  local git_status = vim.b.gitsigns_status_dict
  if git_status == nil then
    git_status = {}
  end
  if git_status["added"] == nil then
    git_status["added"] = 0
  end
  if git_status["changed"] == nil then
    git_status["changed"] = 0
  end
  if git_status["removed"] == nil then
    git_status["removed"] = 0
  end

  ctx.gitstatus = git_status
end

local content = function(key, opts)
  return Item {
    priority = opts.priority,
    hidden = function(_, ctx)
      return ctx.gitstatus[key] == 0
    end,
    hl = { fg = opts[key .. "_hl"].fg, bg = opts.hl.bg },
    prefix = opts[key .. "_prefix"],
    content = function(_, ctx)
      return tostring(ctx.gitstatus[key])
    end,
    prepare = prepare,
    -- suffix = opts.suffix,
    -- sep_right = opts.sep_right,
    on_click = opts.on_click,
    context = opts.context,
    cache = {
      scope = "buf",
      clear = "BufModifiedSet",
    },
  }
end

local mod = {}

function mod.create(opts)
  local item = Item {
    priority = opts.priority,
    hidden = function(_, ctx)
      return ctx.gitstatus.added == 0 and ctx.gitstatus.changed == 0 and ctx.gitstatus.removed == 0
    end,
    hl = opts.hl,
    sep_left = opts.sep_left,
    prefix = opts.prefix,
    content = {
      content("added", opts),
      content("changed", opts),
      content("removed", opts),
    },
    prepare = prepare,
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
