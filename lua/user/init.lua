require "user.early-settings"

require "user.options"
require "user.plugins"
require "user.filetype"
require "user.keymaps"
require "user.colors"

pcall(require, "user.local")

if vim.g.neovide or vim.g.gonvim_running then
  require "user.ginit"
end
