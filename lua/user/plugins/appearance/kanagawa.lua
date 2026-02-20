return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
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

    local colors = require("kanagawa.colors").setup { theme = "wave" }
    local theme = colors.theme
    local palette = colors.palette
    _G.color_palette = palette

    local overrides = {
      Visual = { bg = "#2b4960" },

      -- DiffAdd = { bg = palette.autumnGreen },
      DiffChange = { bg = palette.waveBlue2 },

      DiagnosticVirtualTextError = { link = "DiagnosticError" },
      DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
      DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
      DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

      DiagnosticSignInfo = { fg = palette.dragonBlue },
      DiagnosticSignWarn = { fg = palette.roninYellow },

      NeoTreeNormal = { fg = palette.fujiWhite, bg = palette.sumiInk2 },
      NeoTreeNormalNC = { fg = palette.fujiWhite, bg = palette.sumiInk2 },
      NeoTreeCursorLine = { bg = palette.sumiInk4 },

      ScrollView = { bg = "#342e4f" },

      IlluminatedWordText = { fg = "NONE", bg = "#472739" },
      IlluminatedWordRead = { fg = "NONE", bg = "#472739" },
      IlluminatedWordWrite = { fg = "NONE", bg = "#472739" },

      GitSignsAddNr = { link = "DiffAdd" },
      GitSignsChangeNr = { link = "DiffChange" },
      GitSignsDeleteNr = { link = "DiffDelete" },

      NeoTreeGitModified = { fg = palette.autumnYellow, bg = "NONE" },
      Folded = { bg = "#342e4f" },

      FidgetTitle = { fg = palette.fujiWhite },
      FidgetTask = { fg = palette.oldWhite },

      PackageInfoOutdatedVersion = { link = "DiagnosticWarn" },
      PackageInfoUpToDateVersion = { link = "DiagnosticInfo" },

      IblIndent = { fg = theme.ui.whitespace },
      IblWhitespace = { fg = theme.ui.whitespace },
      IblScope = { fg = theme.ui.special },
      NvimTreeWindowPicker = { bg = palette.autumnRed },
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
      pattern = "*/nvim/lua/user/plugins/appearance/kanagawa.lua",
      group = vim.api.nvim_create_augroup("kanagawa_compile", { clear = true }),
      callback = function()
        vim.cmd "KanagawaCompile"
      end,
    })

    vim.cmd "colorscheme kanagawa"
  end,
}
