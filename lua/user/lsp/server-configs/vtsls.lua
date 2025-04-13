local create_config = require("user.lsp.config-builder").create_config
local node_or_deno = require("user.shared.lsp-selector.web").judge

return function()
  require("lspconfig.configs").vtsls = require("vtsls").lspconfig

  require("lspconfig").vtsls.setup(create_config {
    root_dir = function(path)
      if node_or_deno(path).type == "node" then
        return node_or_deno(path).root
      end
    end,
    single_file_support = false,
  })
end
