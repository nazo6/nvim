local create_config = require("user.config.lsp.setup.config-builder").create_config
local root_pattern = require("lspconfig").util.root_pattern

local node_root_pattern = root_pattern("package.json", "tsconfig.json")

return function(server_name)
  local config = create_config {
    root_dir = node_root_pattern,
    single_file_support = false,
  }

  require("typescript").setup {
    disable_commands = false,
    debug = false,
    go_to_source_definition = {
      fallback = true,
    },
    server = config,
  }
end
