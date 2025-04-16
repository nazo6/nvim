local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup
local root_pattern = require("lspconfig").util.root_pattern

return create_setup {
  cmd = { "omnisharp" },
  root_dir = root_pattern("*.sln", "*.csproj"),
  -- handlers = {
  --   ["textDocument/definition"] = function(...)
  --     require("omnisharp_extended").handler(...)
  --   end,
  -- },
}
