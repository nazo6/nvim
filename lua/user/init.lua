require "user.early-settings"

if vim.fn.has "gui_running" then
  require "user.ginit"
end

require "user.options"
require "user.lazy"
require "user.filetype"
require "user.keymaps"
require "user.colors"

pcall(require, "user.local")
