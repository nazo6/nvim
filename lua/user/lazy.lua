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

require("lazy").setup(spec, {
  defaults = {
    lazy = true,
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

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { buffer = true })
