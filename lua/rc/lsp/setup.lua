local serverConfigs = require "rc.lsp.serverconfigs"
local commonConfigs = require "rc.lsp.config"

require("rc.lsp.null-ls").setup(commonConfigs)

local function setup_servers()
  require("lspinstall").setup()
  local servers = require("lspinstall").installed_servers()
  for _, server in pairs(servers) do
    local config = serverConfigs[server]
    if config == nil then
      config = {}
    else
      -- print(inspect(config))
    end

    local server_on_attach = config.on_attach
    config.on_attach = function(client, bufnr)
      if server_on_attach ~= nil then
        server_on_attach(client, bufnr)
      end
      commonConfigs.on_attach(client, bufnr)
    end
    config.capabilities = commonConfigs.capabilities

    require("lspconfig")[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd "bufdo e"
end

require("lspkind").init {}

vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
