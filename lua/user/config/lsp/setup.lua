local configs = require "user.config.lsp.configs"
local utils = require "user.config.lsp.utils"

require("mason-lspconfig").setup()

require("nlspsettings").setup {
  local_settings_dir = ".nvim",
  local_settings_root_markers = { ".git" },
  append_default_schemas = true,
  loader = "json",
}

require("mason-lspconfig").setup_handlers {
  function(server_name)
    local config_fn = configs.mason[server_name] or utils.default_setup
    config_fn(server_name)
  end,
}

for server_name in pairs(configs.manual) do
  local config_fn = configs.manual[server_name]
  config_fn(server_name)
end

require("lsp_lines").setup()

require "user.config.lsp.null-ls"

require "user.config.lsp.glance"

vim.cmd "LspStart"
