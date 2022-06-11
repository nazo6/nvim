local vi_mode_utils = require "feline.providers.vi_mode"
local providers = require "config.plugin.feline.providers"

local M = {
  active = {},
  inactive = {},
}

M.active[1] = {
  {
    provider = "▊",
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
        bg = "sumiInk4",
      }
    end,
    bg = "sumiInk0",
  },
  {
    provider = " ",
  },
  {
    provider = {
      name = "file_type",
      opts = {
        case = "lowercase",
      },
    },
    hl = {
      fg = "white",
      bg = "sumiInk4",
    },
    left_sep = { "left_rounded" },
    right_sep = { "right_rounded" },
  },
  {
    provider = " ",
    hl = {
      bg = "sumiInk0",
    },
  },
  {
    provider = providers.file_format_with_icon,
    hl = {
      fg = "white",
      bg = "sumiInk4",
    },
    left_sep = { "left_rounded" },
    right_sep = { { str = " ", hl = { bg = "sumiInk4" } } },
  },
  {
    provider = "file_encoding",
    hl = {
      fg = "white",
      bg = "sumiInk4",
    },
    right_sep = "right_rounded",
  },
  {
    provider = " ",
  },
  {
    provider = "lsp_client_names",
    truncate_hide = true,
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
    provider = "git_diff_added",
    hl = {
      fg = "green",
    },
    truncate_hide = true,
  },
  {
    provider = "git_diff_changed",
    icon = "  ",
    hl = {
      fg = "orange",
    },
    truncate_hide = true,
  },
  {
    provider = "git_diff_removed",
    hl = {
      fg = "red",
    },
    truncate_hide = true,
  },
  {
    provider = " ",
  },
  {
    provider = "git_branch",
    hl = {
      bg = "sumiInk0",
    },
  },
  {
    provider = " ",
    hl = {
      bg = "sumiInk0",
    },
  },
}

M.inactive[1] = {
  {
    hl = {
      bg = "sumiInk0",
    },
  },
}

return M
