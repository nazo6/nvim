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
-- Default options:
require("kanagawa").setup {
  undercurl = true, -- enable undercurls
  commentStyle = "italic",
  functionStyle = "NONE",
  keywordStyle = "italic",
  statementStyle = "bold",
  typeStyle = "NONE",
  variablebuiltinStyle = "italic",
  specialReturn = true, -- special highlight for the return keyword
  specialException = true, -- special highlight for exception handling keywords
  transparent = false, -- do not set background color
  colors = {},
  overrides = overrides,
}

-- setup must be called before loading
vim.cmd "colorscheme kanagawa"
