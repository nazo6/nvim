local utils = require "heirline.utils"

local FileName = {
  init = function(self)
    self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
    if self.lfilename == "" then
      self.lfilename = "[No Name]"
    end
  end,

  hl = { fg = utils.get_highlight("Directory").fg },

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

local FileName_Navic = {
  provider = function(self)
    local status = self.navic_available and " true " or " false "
    return status
  end,
}

local Navic = {
  provider = function(self)
    if self.navic_available then
      return require("nvim-navic").get_location()
    end
    return ""
  end,
  update = "CursorMoved",
}

local DefaultWinbar = {
  { FileName, FileName_Navic, Navic },
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
