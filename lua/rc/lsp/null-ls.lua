local common_config = require "rc.lsp.config"

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
  },
  enable_hook = true,
}
require("lspconfig")["null-ls"].setup {
  capabilities = common_config.capabilities,
  on_attach = common_config.on_attach,
}
