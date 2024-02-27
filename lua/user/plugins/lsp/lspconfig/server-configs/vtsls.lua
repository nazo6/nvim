local create_config = require("user.plugins.lsp.lspconfig.config-builder").create_config
local node_or_deno = require("user.shared.lsp-selector.web").judge

local function translate_diag(_, result, ctx, config)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local client_name = client and client.name or "unknown"

  if client_name == "vtsls" then
    local updated_diagnostics = {}

    for _, diagnostic in ipairs(result.diagnostics) do
      diagnostic.message = require("ts-error-translator").translate(diagnostic.code, diagnostic.message)

      table.insert(updated_diagnostics, diagnostic)
    end
    result.diagnostics = updated_diagnostics
  end

  vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end

return function()
  require("lspconfig.configs").vtsls = require("vtsls").lspconfig

  require("ts-error-translator").setup {
    auto_override_publish_diagnostics = false,
  }
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(translate_diag, {})

  require("lspconfig").vtsls.setup(create_config {
    root_dir = function(path)
      if node_or_deno(path).type == "node" then
        return node_or_deno(path).root
      end
    end,
    single_file_support = false,
  })
end
