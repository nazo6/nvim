local windline = require "windline"
local helper = require "windline.helpers"
local sep = helper.separators
local vim_components = require "windline.components.vim"

local b_components = require "windline.components.basic"
local state = _G.WindLine.state

local lsp_comps = require "windline.components.lsp"
local git_comps = require "windline.components.git"

local hl_list = {
  Black = { "white", "black" },
  White = { "black", "white" },
  Inactive = { "InactiveFg", "InactiveBg" },
  Active = { "ActiveFg", "ActiveBg" },
}
local basic = {}

basic.divider = { b_components.divider, "" }
basic.space = { " ", "" }
basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
basic.line_col_inactive = { b_components.line_col, hl_list.Inactive }

basic.vi_mode = {
  hl_colors = {
    Normal = { "black", "red", "bold" },
    Insert = { "black", "green", "bold" },
    Visual = { "black", "yellow", "bold" },
    Replace = { "black", "blue_light", "bold" },
    Command = { "black", "magenta", "bold" },
    NormalBefore = { "red", "ActiveBg" },
    InsertBefore = { "green", "ActiveBg" },
    VisualBefore = { "yellow", "ActiveBg" },
    ReplaceBefore = { "blue_light", "ActiveBg" },
    CommandBefore = { "magenta", "ActiveBg" },
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

local default = {
  filetypes = { "default" },
  active = {
    basic.space,
    basic.vi_mode,
    basic.space,
    basic.logo,
    basic.file,
    { vim_components.search_count(), { "red", "black_light" } },
    { sep.right_rounded, { "black_light", "black" } },
    basic.lsp_diagnos,
    { " ", hl_list.Black },
    basic.divider,
    { git_comps.git_branch { icon = "  " }, { "green", "black" }, 90 },
    basic.git,
    { " ", hl_list.Black },
  },
  inactive = {
    basic.file_name_inactive,
    basic.divider,
    basic.line_col_inactive,
  },
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
