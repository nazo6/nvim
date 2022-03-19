require("nlspsettings").setup {
  local_settings_dir = ".nvim",
  local_settings_root_markers = { ".git" },
  append_default_schemas = true,
  loader = "json",
}
