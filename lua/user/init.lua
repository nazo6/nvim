require "user.profile"

pcall(require, "user.local.early-init")
require "user.early-init"

if vim.fn.has "gui_running" == 1 then
  require "user.ginit"
end

require "user.config.options"
require "user.lazy"
require "user.config.filetype"
require "user.config.keymaps"

pcall(require, "user.local")
