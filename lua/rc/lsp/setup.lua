local configs = require "rc.lsp.configs"
local utils = require "rc.lsp.utils"

local lsp_status = require "lsp-status"
lsp_status.config {
  diagnostics = false,
}
lsp_status.register_progress()

require("nvim-lsp-installer").on_server_ready(function(server)
  local config_fn = configs[server.name] or utils.default_config
  config_fn(server)
end)

require "rc.lsp.null-ls"
