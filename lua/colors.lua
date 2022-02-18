if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

local ok, kanagawa = pcall(require, "kanagawa")
if ok then
  local palette = require("kanagawa.colors").setup()
  local overrides = {
    -- StatusLine = { fg = palette.fujiWhite, bg = "blue" },
    -- StatusLineNC = { fg = palette.fujiGray, bg = "blue" },
    NvimTreeNormal = { fg = palette.fujiWhite, bg = palette.sumiInk2 },
    NvimTreeNormalNC = { fg = palette.fujiWhite, bg = palette.sumiInk2 },
    NvimTreeGitIgnored = { fg = "#8c8c8c" },
    NvimTreeGitDeleted = { fg = "#C74E39" },
    NvimTreeGitRenamed = { fg = "yellow" },
    NvimTreeGitNew = { fg = "#81B88B" },
    NvimTreeGitDirty = { fg = "#E2C08D" },
    NvimTreeGitStaged = { fg = "yellow" },
    NvimTreeGitMerge = { fg = "cyan" },

    ScrollView = { bg = palette.sumiInk4 },
  }
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
