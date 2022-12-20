local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

local plugins = {}

local function use(plugin)
  table.insert(plugins, plugin)
end

require "user.plugins.common"(use)

require "user.plugins.appearance"(use)
require "user.plugins.debug"(use)
require "user.plugins.edit"(use)
require "user.plugins.language"(use)
require "user.plugins.lsp"(use)
require "user.plugins.tools"(use)
require "user.plugins.treesitter"(use)
require "user.plugins.utils"(use)

require("lazy").setup(plugins, {
  defaults = {
    lazy = true,
  },
})
