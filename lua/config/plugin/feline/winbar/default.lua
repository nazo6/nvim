local M = {
  active = {},
  inactive = {},
}

M.active[1] = {
  {
    provider = " ",
    hl = {
      bg = "autumnRed",
    },
  },
  {
    provider = "file_info",
    hl = {
      fg = "fujiWhite",
      bg = "autumnRed",
    },
    right_sep = {
      str = "slant_right",
      hl = function()
        local ok, navic = pcall(require, "nvim-navic")
        if ok and navic.is_available() and navic.get_location() ~= "" then
          return {
            fg = "autumnRed",
            bg = "katanaGray",
          }
        else
          return {
            fg = "autumnRed",
          }
        end
      end,
    },
  },
  {
    provider = function()
      local ok, navic = pcall(require, "nvim-navic")
      return ok and navic.get_location() or "error"
    end,
    enabled = function()
      local ok, navic = pcall(require, "nvim-navic")
      return ok and navic.is_available()
    end,
    hl = {
      bg = "katanaGray",
    },
    left_sep = {
      str = "  ",
      hl = {
        fg = "autumnRed",
        bg = "katanaGray",
      },
    },
    right_sep = {
      str = "slant_right",
      hl = {
        fg = "katanaGray",
      },
    },
  },
  {
    provider = "  ",
  },
  {
    provider = "position",
    right_sep = " ",
  },
}

M.inactive[1] = {
  {
    provider = " ",
    hl = {
      bg = "sumiInk4",
    },
  },
  {
    provider = "file_info",
    hl = {
      fg = "fujiWhite",
      bg = "sumiInk4",
    },
    right_sep = {
      str = "slant_right",
      hl = {
        fg = "sumiInk4",
      },
    },
  },
  {
    provider = "  ",
  },
  {
    provider = "position",
  },
}

return M
