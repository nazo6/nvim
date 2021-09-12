local server_configs = require "rc.lsp.serverconfigs"
local common_config = require "rc.lsp.config"

require("rc.lsp.null-ls").setup(common_config)

for key, _ in pairs(server_configs) do
  local server_on_attach = server_configs[key].on_attach
  server_configs[key].on_attach = function(client, bufnr)
    if server_on_attach ~= nil then
      server_on_attach(client, bufnr)
    end
    common_config.on_attach(client, bufnr)
  end
  server_configs.capabilities = common_config.capabilities
end

require("installer").setup {}
require("installer.integrations.ls").setup {
  configs = server_configs,
}

require("lspkind").init {}

vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
