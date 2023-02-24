local utils = require "heirline.utils"
local conditions = require "heirline.conditions"

local separators = require("user.config.heirline.utils").separators
local colors = require("user.config.heirline.utils").colors

local highlights = {
  file = { bg = colors.katanaGray },
}
local highlights_generated = {
  file_sep = { fg = highlights.file.bg },
}

local Space = {
  provider = " ",
}

local ViMode = require "user.config.heirline.statusline.vimode"

local File
do
  local FileIcon = {
    init = function(self)
      self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color_by_filetype(self.filetype, { default = true })
    end,
    provider = function(self)
      return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
      return { fg = self.icon_color }
    end,
  }
  local FileType = {
    provider = function(self)
      if self.filetype == "" then
        return "Undetected"
      else
        return self.filetype
      end
    end,
  }
  local SepRight = {
    provider = separators.slant_right,
    hi = highlights_generated.file_sep,
  }

  File = {
    { FileIcon, FileType, SepRight },
    hi = highlights.file,
    init = function(self)
      self.filetype = vim.bo.filetype
    end,
  }
end

return {
  { ViMode, Space, File },
}
