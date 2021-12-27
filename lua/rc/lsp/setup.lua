local configs = require "rc.lsp.configs"

local utils = require "rc.lsp.utils"

require("nvim-lsp-installer").on_server_ready(function(server)
  local opts = configs[server.name]
  utils.setup(opts, server)
end)

require "rc.lsp.null-ls"
