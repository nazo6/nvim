local create_setup = require("user.lsp.config-builder").create_setup
local node_or_deno = require("user.shared.lsp-selector.web").judge

return function()
  require "vtsls"

  create_setup {
    root_dir = function(path)
      if node_or_deno(path).type == "node" then
        return node_or_deno(path).root
      end
    end,
    single_file_support = false,
  }
end
