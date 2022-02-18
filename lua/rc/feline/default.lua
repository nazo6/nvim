local vi_mode_utils = require "feline.providers.vi_mode"
local M = {
  active = {},
  inactive = {},
}

M.active[1] = {
  {
    provider = "█ ",
    hl = {
      fg = "crystalBlue",
    },
  },
  {
    provider = "vi_mode",
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
        style = "bold",
      }
    end,
    icon = "",
    right_sep = { " " },
  },
  {
    provider = "file_info",
    hl = {
      fg = "white",
      bg = "waveBlue2",
    },
    left_sep = {
      "left_rounded",
    },
    right_sep = {
      "right_rounded",
      " ",
    },
  },
  {
    provider = "position",
    left_sep = " ",
  },
  {
    provider = "diagnostic_errors",
    hl = { fg = "red" },
  },
  {
    provider = "diagnostic_warnings",
    hl = { fg = "yellow" },
  },
  {
    provider = "diagnostic_hints",
    hl = { fg = "cyan" },
  },
  {
    provider = "diagnostic_info",
    hl = { fg = "skyblue" },
  },
}

-- Right
M.active[2] = {
  {
    provider = require("rc.feline.providers").file_format_with_icon,
    hl = {
      fg = "white",
      bg = "sumiInk4",
    },
    left_sep = {
      "left_rounded",
    },
    right_sep = { { str = " ", hl = { bg = "sumiInk4" } } },
  },
  {
    provider = "file_encoding",
    hl = {
      fg = "white",
      bg = "sumiInk4",
    },
    right_sep = { "right_rounded", " " },
  },
  {
    provider = "git_branch",
  },
  {
    provider = "git_diff_added",
  },
  {
    provider = "git_diff_changed",
  },
  {
    provider = "git_diff_removed",
  },
  {
    provider = " ",
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
