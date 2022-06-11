local M = {
  active = {},
  inactive = {},
}

local gps = require "nvim-gps"
require("nvim-gps").setup()

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
        if gps.is_available() and gps.get_location() ~= "" then
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
      return gps.get_location()
    end,
    enabled = function()
      return gps.is_available()
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
