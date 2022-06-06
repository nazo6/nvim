local create_setup = require("config.plugin.lsp.utils").create_setup

return create_setup {
  settings = {
    settings = {
      texlab = {
        auxDirectory = ".",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = true,
        },
        chktex = {
          onEdit = true,
          onOpenAndSave = true,
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false,
        },
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
  },
}
