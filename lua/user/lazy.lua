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

local available, local_spec = pcall(require, "user.local.plugins")
local spec
if available then
  spec = {
    { import = "user.plugins" },
    local_spec,
  }
else
  spec = "user.plugins"
end

if vim.g.plugin_enabled == nil then
  vim.g.plugin_enabled = {}
end

require("lazy").setup(spec, {
  defaults = {
    lazy = true,
    cond = function(plugin)
      if vim.g.plugin_enabled[plugin.name] == false then
        return false
      end
      return true
    end,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "man",
      },
    },
  },
})

map("n", "<leader>l", "<cmd>Lazy<CR>", { buffer = true })
