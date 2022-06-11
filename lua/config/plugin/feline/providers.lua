local M = {}

-- https://raw.githubusercontent.com/just3ws/nerd-font-cheatsheets/master/powerline-extras.md
-- https://github.com/just3ws/nerd-font-cheatsheets
local icons = {
  linux = " ",
  macos = " ",
  windows = " ",
}

function M.file_format_with_icon()
  local os = vim.bo.fileformat:upper()
  local icon
  if os == "UNIX" then
    icon = icons.linux
  elseif os == "MAC" then
    icon = icons.macos
  else
    icon = icons.windows
  end
  return icon .. os
end

function M.treesitter_status()
  local ts = vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()]
  local mes = (ts and next(ts)) and "滑  " or ""
  return mes
end

return M
