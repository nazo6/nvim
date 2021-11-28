local hl = {
  Active = { "ActiveFg", "ActiveBg" },
  Inactive = { "InactiveFg", "InactiveBg" },
}
local active = {
  { " ", hl_list.Black },
  basic.vi_mode,
  { " ", hl_list.Black },
  basic.logo,
  basic.file,
  { vim_components.search_count(), { "red", "black_light" } },
  { sep.right_rounded, { "black_light", "black" } },
  basic.lsp_diagnos,
  { " ", hl_list.Black },
  basic.gps,
  { " ", hl_list.Black },
  basic.lsp_status,
  basic.divider,
  { git_comps.git_branch { icon = "  " }, { "green", "black" }, 90 },
  basic.git,
  { " ", hl_list.Black },
  basic.right,
  { " ", hl_list.Black },
}

return {
  filetypes = { "default" },
  active = {},
  inactive = {
    basic.file_name_inactive,
    basic.divider,
    basic.divider,
    basic.line_col_inactive,
    { "", { "white", "InactiveBg" } },
    basic.progress_inactive,
  },
}
