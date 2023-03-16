local colors = require("kanagawa.colors").setup().palette
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
  DiffAdd = { bg = colors.autumnGreen },

  DiagnosticVirtualTextError = { link = "DiagnosticError" },
  DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
  DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
  DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

  NeoTreeNormal = { fg = colors.fujiWhite, bg = colors.sumiInk2 },
  NeoTreeNormalNC = { fg = colors.fujiWhite, bg = colors.sumiInk2 },
  NeoTreeCursorLine = { bg = colors.sumiInk4 },

  ScrollView = { bg = colors.sumiInk4 },

  IlluminatedWordText = { fg = "NONE", bg = "#472739" },
  IlluminatedWordRead = { fg = "NONE", bg = "#472739" },
  IlluminatedWordWrite = { fg = "NONE", bg = "#472739" },

  DiffChange = { bg = colors.waveBlue2 },

  GitSignsAddNr = { link = "DiffAdd" },
  GitSignsChangeNr = { link = "DiffChange" },
  GitSignsDeleteNr = { link = "DiffDelete" },

  NeoTreeGitModified = { fg = colors.autumnYellow, bg = "NONE" },
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
