local configs = require "user.config.lsp.configs"
local utils = require "user.config.lsp.utils"

require("mason-lspconfig").setup()

require("neoconf").setup()

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

-- Setup lsp related plugins
require("lsp_lines").setup()
require("lsp_signature").setup()
require("nvim-lightbulb").setup {
  autocmd = { enabled = true },
  sign = { enabled = false },
  virtual_text = { enabled = true, hl_mode = "combine" },
}

require "user.config.lsp.null-ls"

vim.cmd "LspStart"
