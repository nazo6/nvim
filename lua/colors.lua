if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

local ok, value = pcall(require, "tokyonight")
if ok then
  local fg_gutter = "#606682"

  vim.g.tokyonight_sidebars = { "NvimTree" }
  vim.g.tokyonight_style = "night"

  vim.g.tokyonight_colors = {
    fg_gutter = fg_gutter,
  }

  vim.cmd [[colorscheme tokyonight]]

  local overrides = {
    NvimTreeGitIgnored = { fg = "#8c8c8c" },
    NvimTreeGitDeleted = { fg = "#C74E39" },
    NvimTreeGitRenamed = { fg = "yellow" },
    NvimTreeGitNew = { fg = "#81B88B" },
    NvimTreeGitDirty = { fg = "#E2C08D" },
    NvimTreeGitStaged = { fg = "yellow" },
    NvimTreeGitMerge = { fg = "cyan" },

    FidgetTask = { fg = fg_gutter },

    TreesitterContext = { bg = "#3e3e59" },
  }
  for key, value in pairs(overrides) do
    vim.api.nvim_set_hl(0, key, value)
  end
end
