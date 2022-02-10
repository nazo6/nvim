require "early-settings"

require "plugins"
require "settings"
require "colors"
require "keymaps"

vim.keymap.set("n", "asdf", _G.__luacache.print_profile)
