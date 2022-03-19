local configs = require "config.plugin.lsp.configs"
local utils = require "config.plugin.lsp.utils"

require("fidget").setup {
  text = {
    spinner = "dots",
  },
}

require("nvim-lsp-installer").on_server_ready(function(server)
  local config_fn = configs[server.name] or utils.default_setup
  config_fn(server)
end)

require "config.plugin.lsp.null-ls"
