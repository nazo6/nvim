local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

return create_setup {
  settings = {
    texlab = {
      build = {
        args = { "-pv", "-lualatex", "-output-directory=out" },
        executable = "latexmk",
        forwardSearchAfter = true,
        onSave = true,
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
      outputDirectory = "out",
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
