local ok, kanagawa = pcall(require, "kanagawa")
if ok then
  local colors = require("kanagawa.colors").setup()
  if not colors then
    return
  end
  kanagawa.setup {
    commentStyle = { italic = true },
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    variablebuiltinStyle = { italic = true },
    undercurl = true,
    specialReturn = true,
    specialException = true,
    transparent = false,
  }

  local overrides = {
    DiagnosticVirtualTextError = { fg = colors.diag.error, bg = "#2D0505" },
    DiagnosticVirtualTextWarn = { fg = colors.diag.warning, bg = "#331900" },
    DiagnosticVirtualTextInfo = { fg = colors.diag.info, bg = "#151D1B" },
    DiagnosticVirtualTextHint = { fg = colors.diag.hint, bg = "#141B1E" },

    NeoTreeNormal = { fg = colors.fujiWhite, bg = colors.sumiInk2 },
    NeoTreeNormalNC = { fg = colors.fujiWhite, bg = colors.sumiInk2 },
    NeoTreeCursorLine = { bg = colors.sumiInk4 },
    NeoTreeGitIgnored = { fg = "#8c8c8c" },
    NeoTreeGitDeleted = { fg = "#C74E39" },
    NeoTreeGitRenamed = { fg = "yellow" },
    NeoTreeGitNew = { fg = "#81B88B" },
    NeoTreeGitDirty = { fg = "#E2C08D" },
    NeoTreeGitStaged = { fg = "yellow" },
    NeoTreeGitMerge = { fg = "cyan" },

    ScrollView = { bg = colors.sumiInk4 },

    IlluminatedWordText = { fg = "NONE", bg = "#472739" },
    IlluminatedWordRead = { fg = "NONE", bg = "#472739" },
    IlluminatedWordWrite = { fg = "NONE", bg = "#472739" },

    DiffChange = { bg = colors.waveBlue2 },
  }
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      for group, styles in pairs(overrides) do
        vim.api.nvim_set_hl(0, group, styles)
      end
    end,
  })

  vim.cmd "colorscheme kanagawa"
end
