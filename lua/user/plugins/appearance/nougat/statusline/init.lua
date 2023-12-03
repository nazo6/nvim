local stl_active = require "user.plugins.appearance.nougat.statusline.active"
local stl_inactive = require "user.plugins.appearance.nougat.statusline.inactive"
local stl_explorer = require "user.plugins.appearance.nougat.statusline.explorer"

---@param ctx nougat_core_expression_context
return function(ctx)
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = ctx.bufnr })
  if filetype == "NvimTree" then
    return stl_explorer
  elseif ctx.is_focused then
    return stl_active
  else
    return stl_inactive
  end
end
