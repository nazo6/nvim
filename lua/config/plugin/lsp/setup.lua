local configs = require "config.plugin.lsp.configs"
local utils = require "config.plugin.lsp.utils"

require("fidget").setup {
  text = {
    spinner = "dots",
  },
}

require("nlspsettings").setup {
  local_settings_dir = ".nvim",
  local_settings_root_markers = { ".git" },
  append_default_schemas = true,
  loader = "json",
}

local lsp_installer = require "nvim-lsp-installer"
lsp_installer.setup {}

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  local config_fn = configs[server.name] or utils.default_setup
  config_fn(server)
end

require "config.plugin.lsp.null-ls"
