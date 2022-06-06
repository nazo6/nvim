local create_setup = require("config.plugin.lsp.utils").create_setup

return create_setup {
  settings = {
    texlab = {
      build = {
        args = { "-pv" },
        executable = "latexmk",
        forwardSearchAfter = true,
        onSave = true,
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
      latexFormatter = "latexindent",
      forwardSearch = {
        executable = "sumatrapdf",
        args = {
          "-reuse-instance",
          "%p",
          "-forward-search",
          "%f",
          "%l",
        },
      },
    },
  },
}
