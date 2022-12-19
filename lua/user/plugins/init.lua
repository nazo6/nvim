local plugin_path = vim.fn.stdpath "data" .. "/dein"
local dein_path = plugin_path .. "/repos/github.com/Shougo/dein.vim"

if vim.fn.empty(vim.fn.glob(plugin_path)) > 0 then
  vim.fn.system { "git", "clone", "https://github.com/Shougo/dein.vim", dein_path }
end

vim.opt.runtimepath:append(dein_path)

local dein = require "dein"
local use = dein.add

dein.begin(plugin_path)

dein.add(dein_path)
dein.add "wsdjeg/dein-ui.vim"

require "user.plugins.common"(use)
require "user.plugins.appearance"(use)
require "user.plugins.tools"(use)
require "user.plugins.utils"(use)
require "user.plugins.edit"(use)
require "user.plugins.lsp"(use)
require "user.plugins.treesitter"(use)
require "user.plugins.debug"(use)
require "user.plugins.language"(use)

dein.end_()
dein.call_hook "source"
