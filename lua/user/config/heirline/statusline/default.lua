local utils = require "heirline.utils"
local conditions = require "heirline.conditions"

local separators = require("user.config.heirline.utils").separators
local colors = require("user.config.heirline.utils").colors

local highlights = {
  git = { bg = colors.waveBlue1 },
  git_add = { fg = "green" },
  git_change = { fg = "orange" },
  git_del = { fg = "red" },
  support = { bg = colors.sumiInk3 },
}
local highlights_generated = {
  git_sep = { fg = highlights.git.bg, bg = colors.sumiInk0 },
}

local Space = {
  provider = " ",
}

local Align = {
  provider = "%=",
}

local ViMode = require "user.config.heirline.statusline.vimode"

local File
do
  local FileInnerSep = {
    provider = " " .. separators.vertical_bar .. " ",
  }
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
  local NlFormat = {
    provider = function()
      local os = vim.bo.fileformat
      local text
      if os == "unix" then
        text = "LF"
      elseif os == "mac" then
        text = "CR"
      else
        text = "CRLF"
      end
      return text
    end,
  }
  local FileEncoding = {
    provider = function()
      local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
      return enc:upper()
    end,
  }

  File = {
    { FileIcon, FileType, FileInnerSep, FileEncoding, FileInnerSep, NlFormat, Space },
    init = function(self)
      self.filetype = vim.bo.filetype
    end,
  }
end

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = highlights.git,

  {
    provider = separators.slant_left,
    hl = highlights_generated.git_sep,
  },
  { -- git branch name
    provider = function(self)
      return "  " .. self.status_dict.head
    end,
    hl = { bold = true },
  },
  {
    provider = function(self)
      local icon = "  "
      local count = self.status_dict.added or 0
      return count > 0 and (icon .. count)
    end,
    hl = highlights.git_add,
  },
  {
    provider = function(self)
      local icon = "  "
      local count = self.status_dict.removed or 0
      return count > 0 and (icon .. count)
    end,
    hl = highlights.git_del,
  },
  {
    provider = function(self)
      local icon = "  "
      local count = self.status_dict.changed or 0
      return count > 0 and (icon .. count)
    end,
    hl = highlights.git_change,
  },
  {
    provider = separators.slant_right_2,
    hl = highlights_generated.git_sep,
  },
}

local SupportStatus
do
  local LSPActive = {
    condition = conditions.lsp_attached,
    update = { "LspAttach", "LspDetach" },

    provider = function()
      local names = {}
      for i, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
        table.insert(names, server.name)
      end
      return " [" .. table.concat(names, " ") .. "]"
    end,
    hl = { fg = "green", bold = true },
  }

  local NullLs = {
    provider = function()
      local text = ""
      if package.loaded["null-ls.sources"] then
        local sources = require "null-ls.sources"
        local ft = vim.bo.filetype
        local available_sources = sources.get_available(ft)
        if #available_sources > 0 then
          text = "煉"
        end
        for _, source in ipairs(available_sources) do
          text = text .. source.name .. " "
        end
      end
      return text
    end,
  }
  local Diagnostics = {
    condition = conditions.has_diagnostics,
    static = {
      error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
      warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
      info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
      hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },
    init = function(self)
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,
    update = { "DiagnosticChanged", "BufEnter" },
    {
      provider = function(self)
        return self.errors > 0 and (self.error_icon .. self.errors .. " ")
      end,
      hl = utils.get_highlight "DiagnosticError",
    },
    {
      provider = function(self)
        return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
      end,
      hl = utils.get_highlight "DiagnosticWarn",
    },
    {
      provider = function(self)
        return self.info > 0 and (self.info_icon .. self.info .. " ")
      end,
      hl = utils.get_highlight "DiagnosticInfo",
    },
    {
      provider = function(self)
        return self.hints > 0 and (self.hint_icon .. self.hints)
      end,
      hl = utils.get_highlight "DiagnosticHint",
    },
  }
  SupportStatus = {
    { LSPActive, NullLs, Diagnostics },
    hl = highlights.support,
  }
end

local Position = {
  provider = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return string.format("%d:%d", line, col)
  end,
}

return {
  { ViMode, Space, File, Git, Space, SupportStatus, Align, Position },
  init = function(self)
    self.git_available = conditions.is_git_repo
    self.support_available = false
  end,
}
