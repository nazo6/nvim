if vim.fn.has "termguicolors" == 1 then
  vim.opt.termguicolors = true
end

local ok, kanagawa = pcall(require, "kanagawa")
if ok then
  local colors = require("kanagawa.colors").setup()
  if not colors then
    return
  end
  local overrides = {
    DiagnosticVirtualTextError = { fg = colors.diag.error, bg = "#2D0505" },
    DiagnosticVirtualTextWarn = { fg = colors.diag.warning, bg = "#331900" },
    DiagnosticVirtualTextInfo = { fg = colors.diag.info, bg = "#151D1B" },
    DiagnosticVirtualTextHint = { fg = colors.diag.hint, bg = "#141B1E" },

    NvimTreeNormal = { fg = colors.fujiWhite, bg = colors.sumiInk2 },
    NvimTreeNormalNC = { fg = colors.fujiWhite, bg = colors.sumiInk2 },
    NvimTreeCursorLine = { bg = colors.sumiInk4 },
    NvimTreeGitIgnored = { fg = "#8c8c8c" },
    NvimTreeGitDeleted = { fg = "#C74E39" },
    NvimTreeGitRenamed = { fg = "yellow" },
    NvimTreeGitNew = { fg = "#81B88B" },
    NvimTreeGitDirty = { fg = "#E2C08D" },
    NvimTreeGitStaged = { fg = "yellow" },
    NvimTreeGitMerge = { fg = "cyan" },

    ScrollView = { bg = colors.sumiInk4 },

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
