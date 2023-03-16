local utils = require "heirline.utils"
local conditions = require "heirline.conditions"

local colors = require("user.config.heirline.utils").colors
local separators = require("user.config.heirline.utils").separators

local highlight = {
  active = {
    file = { bg = colors.autumnRed },
    file_sep = { fg = colors.autumnRed, bg = colors.katanaGray },
    file_sep_terminal = { fg = colors.autumnRed },
    navic = { bg = colors.katanaGray },
  },
  inactive = {
    file = { bg = colors.sakuraPink },
    file_sep = { fg = colors.sakuraPink },
    file_sep_terminal = { fg = colors.sakuraPink },
    navic = {},
  },
  file_modified_icon = {},
  file_readonly_icon = { fg = "orange" },
}

local function get_highlight(group)
  if conditions.is_active() then
    return highlight.active[group]
  else
    return highlight.inactive[group]
  end
end

local Space = {
  provider = " ",
}

local File
do
  local FileIcon = {
    init = function(self)
      local filename = self.filename
      local extension = vim.fn.fnamemodify(filename, ":e")
      self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
      return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
      return { fg = self.icon_color }
    end,
  }

  local FileName = {
    init = function(self)
      self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
      if self.lfilename == "" then
        self.lfilename = "[No Name]"
      end
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

  local FileFlags = {
    {
      condition = function()
        return vim.bo.modified
      end,
      provider = "●",
      hl = highlight.file_modified_icon,
    },
    {
      condition = function()
        return not vim.bo.modifiable or vim.bo.readonly
      end,
      provider = "",
      hl = highlight.file_readonly_icon,
    },
  }

  File = {
    { Space, FileIcon, FileName, Space, FileFlags },
    hl = function()
      return get_highlight "file"
    end,
  }
end

local FileSep = {
  provider = separators.slant_right .. "  ",
  hl = function(self)
    if self.navic_available then
      return get_highlight "file_sep"
    else
      return get_highlight "file_sep_terminal"
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
  hl = function()
    return get_highlight "navic"
  end,
}

local DefaultWinbar = {
  { File, FileSep, Navic },
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)

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
  end,
}
return DefaultWinbar
