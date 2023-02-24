local utils = require "heirline.utils"
local conditions = require "heirline.conditions"

local colors = require("user.config.heirline.utils").colors
local separators = require("user.config.heirline.utils").separators

local highlight = {
  active = {
    filename = { bg = colors.autumnRed },
    filename_sep = { fg = colors.autumnRed, bg = colors.katanaGray },
    filename_sep_terminal = { fg = colors.autumnRed },
    navic = { bg = colors.katanaGray },
  },
  inactive = {
    filename = { bg = colors.sakuraPink },
    filename_sep = { fg = colors.sakuraPink },
    filename_sep_terminal = { fg = colors.sakuraPink },
    navic = {},
  },
}

local function get_highlight(group)
  if conditions.is_active() then
    return highlight.active[group]
  else
    return highlight.inactive[group]
  end
end

local FileName = {
  init = function(self)
    self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
    if self.lfilename == "" then
      self.lfilename = "[No Name]"
    end
  end,

  hl = function()
    return get_highlight "filename"
  end,

  flexible = 2,

  {
    provider = function(self)
      return self.lfilename
    end,
  },
  {
    provider = function(self)
      return vim.fn.pathshorten(self.lfilename)
    end,
  },
}

local FilenameSep = {
  provider = separators.slant_right .. "  ",
  hl = function(self)
    if self.navic_available then
      return get_highlight "filename_sep"
    else
      return get_highlight "filename_sep_terminal"
    end
  end,
}

local Navic = {
  provider = function(self)
    if self.navic_available then
      return require("nvim-navic").get_location() .. " "
    end
    return ""
  end,
  update = "CursorMoved",
  hl = function()
    return get_highlight "navic"
  end,
}

local DefaultWinbar = {
  { FileName, FilenameSep, Navic },
  init = function(self)
    if package.loaded["nvim-navic"] then
      local navic = require "nvim-navic"
      if navic.is_available() then
        local location = navic.get_location()
        if location ~= "" then
          self.navic_available = true
          return
        end
      end
    end
    self.navic_available = false

    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

return DefaultWinbar
