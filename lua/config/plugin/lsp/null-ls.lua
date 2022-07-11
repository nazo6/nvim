local null_ls = require "null-ls"

local common_config = require "config.plugin.lsp.configs.common"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.deno_fmt.with {
      condition = function(utils)
        return not (utils.has_file { ".prettierrc", ".prettierrc.js", "deno.json", "deno.jsonc" })
      end,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "markdown" },
    },
    null_ls.builtins.formatting.prettier.with {
      condition = function(utils)
        return utils.has_file { ".prettierrc", ".prettierrc.js" }
      end,
      prefer_local = "node_modules/.bin",
    },
    null_ls.builtins.formatting.stylua,
  },
  default_timeout = 10000,
  capabilities = common_config.capabilities,
  on_attach = common_config.on_attach,
}
