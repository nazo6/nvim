require "config.early-settings"

require "config.plugins"
require "config.filetype"
require "config.options"
require "config.colors"
require "config.keymaps"

pcall(require, "config.local")
