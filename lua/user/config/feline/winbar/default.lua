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
    provider = {
      name = "file_info",
      opts = {
        type = "relative",
      },
    },
    priority = 1,
    hl = {
      fg = "fujiWhite",
      bg = "autumnRed",
    },
    right_sep = {
      str = "slant_right",
      hl = function()
        if package.loaded["nvim-navic"] then
          local navic = require "nvim-navic"
          if navic.is_available() and navic.get_location() ~= "" then
            return {
              fg = "autumnRed",
              bg = "katanaGray",
            }
          else
            return {
              fg = "autumnRed",
            }
          end
        end
      end,
    },
  },
  {
    provider = function()
      if package.loaded["nvim-navic"] then
        local navic = require "nvim-navic"
        return navic.get_location()
      end
      return "error"
    end,
    truncate_hide = true,
    enabled = function()
      if package.loaded["nvim-navic"] then
        local navic = require "nvim-navic"
        return navic.is_available()
      end
      return false
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
