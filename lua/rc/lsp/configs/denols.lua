local create_config = require("rc.lsp.utils").create_config
local root_pattern = require("lspconfig").util.root_pattern

local deno_root_pattern = root_pattern("deno.json", "deps.ts")

return function(server)
  local config = create_config {
    root_dir = deno_root_pattern,
    init_options = {
      enable = true,
      lint = true,
      unstable = true,
    },
  }

  server:setup(config)
end
