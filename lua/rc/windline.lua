local windline = require "windline"
local helper = require "windline.helpers"
local sep = helper.separators
local vim_components = require "windline.components.vim"

local b_components = require "windline.components.basic"
local state = _G.WindLine.state

local lsp_comps = require "windline.components.lsp"
local git_comps = require "windline.components.git"

local gps = require "nvim-gps"

local hl_list = {
  Black = { "white", "black" },
  White = { "black", "white" },
  Inactive = { "InactiveFg", "InactiveBg" },
  Active = { "ActiveFg", "ActiveBg" },
}
local basic = {}

basic.divider = { b_components.divider, "" }
basic.space = { " ", "" }
basic.bg = { " ", "StatusLine" }
basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
basic.line_col_inactive = { b_components.line_col, hl_list.Inactive }
basic.progress_inactive = { b_components.progress, hl_list.Inactive }

basic.vi_mode = {
  hl_colors = {
    Normal = { "black", "red", "bold" },
    Insert = { "black", "green", "bold" },
    Visual = { "black", "yellow", "bold" },
    Replace = { "black", "blue_light", "bold" },
    Command = { "black", "magenta", "bold" },
    NormalBefore = { "red", "black" },
    InsertBefore = { "green", "black" },
    VisualBefore = { "yellow", "black" },
    ReplaceBefore = { "blue_light", "black" },
    CommandBefore = { "magenta", "black" },
    NormalAfter = { "white", "red" },
    InsertAfter = { "white", "green" },
    VisualAfter = { "white", "yellow" },
    ReplaceAfter = { "white", "blue_light" },
    CommandAfter = { "white", "magenta" },
  },
  text = function()
    return {
      { sep.left_rounded, state.mode[2] .. "Before" },
      { state.mode[1], state.mode[2] },
      { sep.right_rounded, state.mode[2] .. "Before" },
    }
  end,
}

basic.lsp_diagnos = {
  width = 90,
  hl_colors = {
    red = { "red", "black" },
    yellow = { "yellow", "black" },
    blue = { "blue", "black" },
  },
  text = function()
    if lsp_comps.check_lsp() then
      return {
        { lsp_comps.lsp_error { format = "  %s" }, "red" },
        { lsp_comps.lsp_warning { format = "  %s" }, "yellow" },
        { lsp_comps.lsp_hint { format = "  %s" }, "blue" },
      }
    end
    return ""
  end,
}

local icon_comp = b_components.cache_file_icon { default = "", hl_colors = { "white", "black_light" } }

basic.file = {
  hl_colors = {
    default = { "white", "black_light" },
    icon = { "black_light", "black" },
  },
  text = function(bufnr)
    return {
      { " ", "default" },
      { b_components.cache_file_name("[No Name]", ""), "" },
      { b_components.file_modified " ", "" },
      { b_components.cache_file_size(), "" },
      { sep.right_rounded, "icon" },
      { " ", { "blue", "black" } },
      { sep.left_rounded, "icon" },
      { b_components.cache_file_type { default = "[No filetype]" }, "default" },
      { " ", "default" },
      icon_comp(bufnr),
      { " ", "default" },
    }
  end,
}
basic.right = {
  hl_colors = {
    sep_before = { "black_light", "white_light" },
    sep_after = { "white_light", "black" },
    text = { "black", "white_light" },
  },
  text = function()
    return {
      { sep.left_rounded, "sep_after" },
      { b_components.progress, "text" },
      { sep.right_rounded, "sep_after" },
    }
  end,
}
basic.git = {
  width = 90,
  hl_colors = {
    green = { "green", "black" },
    red = { "red", "black" },
    blue = { "blue", "black" },
  },
  text = function()
    if git_comps.is_git() then
      return {
        { " ", "" },
        { git_comps.diff_added { format = " %s" }, "green" },
        { git_comps.diff_removed { format = "  %s" }, "red" },
        { git_comps.diff_changed { format = " 柳 %s" }, "blue" },
      }
    end
    return ""
  end,
}
basic.logo = {
  hl_colors = {
    sep_before = { "blue", "black" },
    default = { "black", "blue" },
  },
  text = function()
    return {
      { sep.left_rounded, "sep_before" },
      { b_components.file_format { icon = true }, { "black", "blue" } },
      { " ", "default" },
    }
  end,
}

basic.gps = {
  function()
    if gps.is_available() then
      return gps.get_location()
    end
    return ""
  end,
  { "white", "black" },
}

basic.lsp_status = {
  function()
    if #vim.lsp.buf_get_clients() > 0 then
      return require("lsp-status").status()
    end
  end,
}

local quickfix = {
  filetypes = { "qf", "Trouble" },
  active = {
    { "🚦 Quickfix ", { "white", "black" } },
    { helper.separators.slant_right, { "black", "black_light" } },
    {
      function()
        return vim.fn.getqflist({ title = 0 }).title
      end,
      { "cyan", "black_light" },
    },
    { " Total : %L ", { "cyan", "black_light" } },
    { helper.separators.slant_right, { "black_light", "InactiveBg" } },
    { " ", { "InactiveFg", "InactiveBg" } },
    basic.divider,
    { helper.separators.slant_right, { "InactiveBg", "black" } },
    { "🧛 ", { "white", "black" } },
  },
  always_active = true,
  show_last_status = true,
}

local explorer = {
  filetypes = { "fern", "NvimTree", "lir" },
  active = {
    { "  ", { "white", "black" } },
    { helper.separators.slant_right, { "black", "black_light" } },
    { b_components.divider, "" },
    { b_components.file_name "", { "white", "black_light" } },
  },
  always_active = true,
  show_last_status = true,
}
windline.setup {
  colors_name = function(colors)
    -- ADD MORE COLOR HERE ----
    return colors
  end,
  statuslines = {
    default,
    quickfix,
    explorer,
  },
}
