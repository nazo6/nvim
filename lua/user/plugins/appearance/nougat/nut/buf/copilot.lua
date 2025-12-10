local Item = require "nougat.item"

local mod = {}

function mod.create(opts)
  local item = Item {
    init = opts.init,
    priority = opts.priority,
    hidden = opts.hidden,
    hl = opts.hl,
    sep_left = opts.sep_left,
    prefix = opts.prefix,
    content = function()
      local content = nil
      if package.loaded["copilot"] then
        local status = require "copilot.status"
        local copilot_status = status.data.status

        if copilot_status == "Normal" then
          content = ""
        elseif copilot_status == "InProgress" then
          content = "  "
        elseif copilot_status == "Warning" then
          content = "  "
        end
      end
      if content ~= nil then
        content = " " .. content
      end
      return content
    end,
    suffix = opts.suffix,
    sep_right = opts.sep_right,
    on_click = opts.on_click,
    context = opts.context,
    ctx = opts.ctx,
    -- cache = {
    --   scope = "buf",
    --   clear = {
    --     "LspAttach",
    --     "LspDetach",
    --   },
    -- },
  }

  return item
end

return mod
