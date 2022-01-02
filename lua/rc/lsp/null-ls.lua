local nullls = require "null-ls"

local common_config = require "rc.lsp.configs.common"

require("installer.integrations.null_ls").setup {
  with = {
    prettier = {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "css",
        "scss",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
      },
    },
  },
  configs = {
    default_timeout = 10000,
    capabilities = common_config.capabilities,
    on_attach = common_config.on_attach,
    sources = {
      nullls.builtins.diagnostics.teal,
    },
  },
  enable_hook = true,
}
