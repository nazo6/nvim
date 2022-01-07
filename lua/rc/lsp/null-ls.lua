local nullls = require "null-ls"

local common_config = require "rc.lsp.configs.common"

require("installer.integrations.null_ls").setup {
  with = {
    prettier = {
      filetypes = {
        "yaml",
        "markdown",
      },
    },
  },
  configs = {
    default_timeout = 10000,
    capabilities = common_config.capabilities,
    on_attach = common_config.on_attach,
  },
  enable_hook = true,
}
