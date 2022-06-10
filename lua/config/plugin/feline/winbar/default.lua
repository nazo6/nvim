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
        bg = "sumiInk1",
      },
    },
  },
  {
    provider = "  ",
  },
  {
    provider = function()
      return gps.get_location()
    end,
    enabled = function()
      return gps.is_available()
    end,
  },
}

M.inactive[1] = {
  { provider = "" },
  {
    provider = {
      name = "file_info",
      opts = {
        type = "full-path",
      },
    },
    short_provider = {
      name = "file_info",
      opts = {
        type = "short-path",
      },
    },
  },
  {},
}

return M
