if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

local ok, kanagawa = pcall(require, "kanagawa")
if ok then
  local palette = require("kanagawa.colors").setup()
  local overrides = {
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

    MiniCursorword = { bg = "#472739" },
    MiniCursorwordCurrent = { fg = "NONE", bg = "#363646" },
  }
  kanagawa.setup {
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    undercurl = true,
    specialReturn = true,
    specialException = true,
    transparent = false,
    colors = {},
    overrides = overrides,
  }

  vim.cmd "colorscheme kanagawa"
end
