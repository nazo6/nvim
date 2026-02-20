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

    local overrides = {
      Visual = { bg = "#2b4960" },
      Folded = { bg = "#342e4f" },
      CursorLineNr = { fg = theme.diag.warning, bg = theme.ui.bg_p2, bold = true },

      DiagnosticVirtualTextError = { link = "DiagnosticError" },
      DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
      DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
      DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

      DiagnosticSignInfo = { fg = palette.dragonBlue },
      DiagnosticSignWarn = { fg = palette.roninYellow },

      FidgetTitle = { fg = palette.fujiWhite },
      FidgetTask = { fg = palette.oldWhite },

      GitSignsAdd = { fg = theme.vcs.added },
      GitSignsChange = { fg = theme.vcs.changed },
      GitSignsDelete = { fg = theme.vcs.removed },

      NeoTreeNormal = { fg = palette.fujiWhite, bg = palette.sumiInk2 },
      NeoTreeNormalNC = { fg = palette.fujiWhite, bg = palette.sumiInk2 },
      NeoTreeCursorLine = { bg = palette.sumiInk4 },
      NeoTreeGitModified = { fg = palette.autumnYellow, bg = "NONE" },

      NvimTreeWindowPicker = { bg = palette.autumnRed },

      PackageInfoOutdatedVersion = { link = "DiagnosticWarn" },
      PackageInfoUpToDateVersion = { link = "DiagnosticInfo" },
    }

    require("user.config.colors").set {
      winbar = {
        active = {
          title = { fg = "white", bg = palette.waveRed },
          other = { fg = palette.fujiWhite, bg = palette.winterRed },
        },
        inactive = {
          title = { bg = palette.sumiInk0 },
          other = { bg = palette.sumiInk4 },
        },
      },
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
