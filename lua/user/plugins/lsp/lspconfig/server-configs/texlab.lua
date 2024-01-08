local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

return create_setup {
  settings = {
    texlab = {
      build = {
        args = { "-pv", "-lualatex" },
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
