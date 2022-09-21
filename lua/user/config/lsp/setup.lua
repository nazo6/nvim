local configs = require "user.config.lsp.configs"
local utils = require "user.config.lsp.utils"

require("mason-lspconfig").setup()

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

require("mason-lspconfig").setup_handlers {
  function(server_name)
    local config_fn = configs[server_name] or utils.default_setup
    config_fn(server_name)
  end,
}

require "user.config.lsp.null-ls"

vim.cmd "LspStart"
