require "user.profile"

pcall(require, "user.local.early-init")
require "user.early-init"

if vim.fn.has "gui_running" then
  require "user.ginit"
end

require "user.options"
require "user.lazy"
require "user.filetype"
require "user.keymaps"

pcall(require, "user.local")
