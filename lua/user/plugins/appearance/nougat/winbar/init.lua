local wbr_active = require "user.plugins.appearance.nougat.winbar.active"
local wbr_inactive = require "user.plugins.appearance.nougat.winbar.inactive"
local wbr_explorer = require "user.plugins.appearance.nougat.winbar.explorer"

---@param ctx nougat_core_expression_context
return function(ctx)
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = ctx.bufnr })
  if filetype == "NvimTree" or filetype == "DiffviewFiles" then
    return wbr_explorer(ctx)
  elseif filetype == "no-neck-pain" then
    return require "nougat.bar" "winbar"
  elseif ctx.is_focused then
    return wbr_active
  else
    return wbr_inactive
  end
end
