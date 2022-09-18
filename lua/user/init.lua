require "user.early-settings"

require "user.plugins"
require "user.filetype"
require "user.options"
require "user.colors"
require "user.keymaps"

pcall(require, "user.local")

if vim.g.neovide or vim.g.gonvim_running then
  require "user.ginit"
end
