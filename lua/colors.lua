if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

local overrides = {
  NvimTreeGitIgnored = { fg = "#8c8c8c" },
  NvimTreeGitDeleted = { fg = "#C74E39" },
  NvimTreeGitRenamed = { fg = "yellow" },
  NvimTreeGitNew = { fg = "#81B88B" },
  NvimTreeGitDirty = { fg = "#E2C08D" },
  NvimTreeGitStaged = { fg = "yellow" },
  NvimTreeGitMerge = { fg = "cyan" },
}
for key, value in pairs(overrides) do
  vim.api.nvim_set_hl(0, key, value)
end

local ok, value = pcall(require, "tokyonight")
if ok then
  vim.g.tokyonight_sidebars = { "NvimTree" }
  vim.g.tokyonight_style = "night"

  vim.cmd [[colorscheme tokyonight]]
end
