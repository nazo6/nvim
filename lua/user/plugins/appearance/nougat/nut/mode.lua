local Item = require "nougat.item"
local color = require("nougat.color").get()
local on_event = require("nougat.util").on_event

local mode_group = {
  ["n"] = "normal",
  ["no"] = "normal",
  ["nov"] = "normal",
  ["noV"] = "normal",
  ["no"] = "normal",
  ["niI"] = "normal",
  ["niR"] = "normal",
  ["niV"] = "normal",
  ["nt"] = "normal",
  ["ntT"] = "normal",

  ["v"] = "visual",
  ["vs"] = "visual",
  ["V"] = "visual",
  ["Vs"] = "visual",
  [""] = "visual",
  ["s"] = "visual",

  ["s"] = "visual",
  ["S"] = "visual",
  [""] = "visual",

  ["i"] = "insert",
  ["ic"] = "insert",
  ["ix"] = "insert",

  ["R"] = "replace",
  ["Rc"] = "replace",
  ["Rx"] = "replace",
  ["Rv"] = "replace",
  ["Rvc"] = "replace",
  ["Rvx"] = "replace",

  ["c"] = "commandline",
  ["cv"] = "commandline",
  ["ce"] = "commandline",
  ["r"] = "commandline",
  ["rm"] = "commandline",
  ["r?"] = "commandline",
  ["!"] = "commandline",

  ["t"] = "terminal",

  ["-"] = "inactive",
}

local default_highlight = {
  normal = {
    bg = "fg",
    fg = "bg",
  },
  visual = {
    bg = color.yellow,
    fg = "bg",
  },
  insert = {
    bg = color.blue,
    fg = "bg",
  },
  replace = {
    bg = color.magenta,
    fg = "bg",
  },
  commandline = {
    bg = color.green,
    fg = "bg",
  },
  terminal = {
    bg = color.cyan,
    fg = "bg",
  },
  inactive = {
    bg = "fg",
    fg = "bg",
  },
}

local cache = {
  mode = "n",
  group = mode_group["n"],
}

on_event("ModeChanged", function()
  local event = vim.v.event
  local old_mode, new_mode = event.old_mode, event.new_mode
  cache.mode, cache.group = new_mode, mode_group[new_mode]
  if old_mode == "t" then
    vim.schedule(function()
      vim.cmd "redrawstatus"
    end)
  end
end)

local function get_hl(item, ctx)
  return default_highlight[ctx.is_focused and cache.group or "inactive"]
end

local mod = {}

function mod.create(opts)
  opts = opts or {}

  local item = Item {
    priority = opts.priority,
    hidden = opts.hidden,
    hl = get_hl,
    sep_left = opts.sep_left,
    prefix = opts.prefix,
    content = " ",
    suffix = opts.suffix,
    sep_right = opts.sep_right,
    on_click = opts.on_click,
    context = opts.context,
  }

  return item
end

return mod
