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

local spec = {
  { import = "user.plugins.appearance" },
  { import = "user.plugins.common" },
  { import = "user.plugins.debug" },
  { import = "user.plugins.edit" },
  { import = "user.plugins.external" },
  { import = "user.plugins.git" },
  { import = "user.plugins.language" },
  { import = "user.plugins.lsp" },
  { import = "user.plugins.tools" },
  { import = "user.plugins.treesitter" },
}

local available, local_spec = pcall(require, "user.local.plugins")
if available then
  table.insert(spec, 1, local_spec)
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
  change_detection = {
    enabled = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "man",
      },
    },
  },
})

map("n", "<leader>l", "<cmd>Lazy<CR>")
