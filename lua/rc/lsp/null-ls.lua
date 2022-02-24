local null_ls = require "null-ls"

local common_config = require "rc.lsp.configs.common"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.deno_fmt.with {
      condition = function(utils)
        return not (utils.root_has_file { ".prettierrc", ".prettier.js" })
      end,
    },
    null_ls.builtins.formatting.prettier.with {
      only_local = "node_modules/.bin",
    },
  },
  default_timeout = 10000,
  capabilities = common_config.capabilities,
  on_attach = common_config.on_attach,
}

require("installer.integrations.null_ls").register {
  enable_hook = true,
}
