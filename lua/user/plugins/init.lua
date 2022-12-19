local plugin_path = vim.fn.stdpath "data" .. "/dein"
local dein_path = plugin_path .. "/repos/github.com/Shougo/dein.vim"

if vim.fn.empty(vim.fn.glob(plugin_path)) > 0 then
  vim.fn.system { "git", "clone", "https://github.com/Shougo/dein.vim", dein_path }
end

vim.opt.runtimepath:append(dein_path)

local dein = require "dein"
local use = dein.add

if dein.load_state(plugin_path) > 0 then
  local confpath = vim.fn.stdpath "config"
  local paths = {
    confpath .. "/lua/user/plugins/init.lua",
    confpath .. "/lua/user/plugins/common.lua",
    confpath .. "/lua/user/plugins/appearance.lua",
    confpath .. "/lua/user/plugins/tools.lua",
    confpath .. "/lua/user/plugins/utils.lua",
    confpath .. "/lua/user/plugins/edit.lua",
    confpath .. "/lua/user/plugins/lsp.lua",
    confpath .. "/lua/user/plugins/treesitter.lua",
    confpath .. "/lua/user/plugins/debug.lua",
    confpath .. "/lua/user/plugins/language.lua",
  }
  dein.begin(plugin_path, paths)

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
  dein.save_state()

  vim.notify "cache created"
end

dein.call_hook "source"
