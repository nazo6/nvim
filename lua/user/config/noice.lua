require("noice").setup {
  cmdline = {
    enabled = true,
    menu = "cmdline_popup",
  },
  popupmenu = {
    backend = "cmp",
  },
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "cmdline",
        find = "^%s*[/?]",
      },
      view = "cmdline",
    },
  },
}
