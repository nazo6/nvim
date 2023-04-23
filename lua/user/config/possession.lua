require("possession").setup {
  silent = true,
  load_silent = true,
  autosave = {
    current = false,
    tmp = false,
    tmp_name = "tmp",
    on_load = true,
    on_quit = true,
  },
  commands = {
    save = "PossessionSave",
    load = "PossessionLoad",
    rename = "PossessionRename",
    close = "PossessionClose",
    delete = "PossessionDelete",
    show = "PossessionShow",
    list = "PossessionList",
    migrate = "PossessionMigrate",
  },
  plugins = {
    close_windows = {
      hooks = { "before_save", "before_load" },
    },
    nvim_tree = true,
    tabby = true,
    dap = true,
    delete_buffers = false,
  },
}
