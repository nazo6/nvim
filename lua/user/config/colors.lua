local kanagawa = require "kanagawa"
kanagawa.setup {
  commentStyle = { italic = true },
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  variablebuiltinStyle = { italic = true },
  undercurl = true,
  specialReturn = true,
  specialException = true,
  transparent = false,
  theme = "wave",
  compile = true,
}

vim.g.palette = require("kanagawa.colors").setup({ theme = "wave" }).palette
local palette = vim.g.palette

local overrides = {
  DiffAdd = { bg = palette.autumnGreen },

  DiagnosticVirtualTextError = { link = "DiagnosticError" },
  DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
  DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
  DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

  NeoTreeNormal = { fg = palette.fujiWhite, bg = palette.sumiInk2 },
  NeoTreeNormalNC = { fg = palette.fujiWhite, bg = palette.sumiInk2 },
  NeoTreeCursorLine = { bg = palette.sumiInk4 },

  ScrollView = { bg = "#342e4f" },

  IlluminatedWordText = { fg = "NONE", bg = "#472739" },
  IlluminatedWordRead = { fg = "NONE", bg = "#472739" },
  IlluminatedWordWrite = { fg = "NONE", bg = "#472739" },

  DiffChange = { bg = palette.waveBlue2 },

  GitSignsAddNr = { link = "DiffAdd" },
  GitSignsChangeNr = { link = "DiffChange" },
  GitSignsDeleteNr = { link = "DiffDelete" },

  NeoTreeGitModified = { fg = palette.autumnYellow, bg = "NONE" },
  Folded = { bg = "#342e4f" },

  FidgetTitle = { fg = palette.fujiWhite },
  FidgetTask = { fg = palette.oldWhite },
}
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    for group, styles in pairs(overrides) do
      vim.api.nvim_set_hl(0, group, styles)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*/nvim/lua/user/colors.lua",
  group = vim.api.nvim_create_augroup("kanagawa_compile", { clear = true }),
  callback = function()
    vim.cmd "KanagawaCompile"
  end,
})

vim.cmd "colorscheme kanagawa"
