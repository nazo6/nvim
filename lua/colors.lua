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
local ok, kanagawa = pcall(require, "kanagawa")
if ok then
  kanagawa.setup {
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,
    specialException = true,
    transparent = false,
    colors = {},
    overrides = overrides,
  }
  vim.cmd "colorscheme kanagawa"
end
