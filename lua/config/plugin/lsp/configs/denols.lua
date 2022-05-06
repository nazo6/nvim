local create_setup = require("config.plugin.lsp.utils").create_setup
local root_pattern = require("lspconfig").util.root_pattern

local deno_root_pattern = root_pattern("deno.json", "deps.ts")

return create_setup {
  root_dir = deno_root_pattern,
  settings = {
    enable = true,
    lint = true,
    unstable = true,
  },
}
