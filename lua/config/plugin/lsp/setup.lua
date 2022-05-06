local configs = require "config.plugin.lsp.configs"
local utils = require "config.plugin.lsp.utils"

require("fidget").setup {
  text = {
    spinner = "dots",
  },
}

local lsp_installer = require "nvim-lsp-installer"
lsp_installer.setup {}

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  local config_fn = configs[server.name] or utils.default_setup
  config_fn(server)
end

require "config.plugin.lsp.null-ls"
