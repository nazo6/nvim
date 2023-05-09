local create_setup = require("user.config.lsp.setup.config-builder").create_setup
local root_pattern = require("lspconfig").util.root_pattern

local deno_root_pattern = root_pattern("deno.json", "deps.ts", "deno.jsonc")

return create_setup {
  root_dir = deno_root_pattern,
  settings = {
    enable = true,
    lint = true,
    unstable = true,
  },
  on_attach = function(client)
    client.server_capabilities.executeCommandProvider = true
  end,
}
