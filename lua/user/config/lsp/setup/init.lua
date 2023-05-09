local server_configs = require "user.config.lsp.setup.server-configs"
local default_setup = require("user.config.lsp.setup.config-builder").default_setup

local servers = require("mason-lspconfig").get_installed_servers()
vim.list_extend(servers, { "satysfi" })

local lsp_augroup = vim.api.nvim_create_augroup("lsp_setup", {})

for _, server_name in ipairs(servers) do
  local config_fn = server_configs[server_name]
  if config_fn == nil then
    config_fn = default_setup
  end

  local ok, server = pcall(require, "lspconfig/server_configurations/" .. server_name)
  if not ok then
    vim.notify("Failed to load lspconfig for " .. server_name)
    goto continue
  end

  vim.api.nvim_create_autocmd("FileType", {
    once = true,
    group = lsp_augroup,
    pattern = server.default_config.filetypes,
    callback = function()
      config_fn(server_name)
      vim.cmd [[LspStart]]
    end,
  })

  ::continue::
end

require "user.config.lsp.setup.attach"
require "user.config.lsp.setup.handlers"
