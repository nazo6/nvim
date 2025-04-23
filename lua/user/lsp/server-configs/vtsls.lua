local create_setup = require("user.lsp.config-builder").create_setup
local node_or_deno = require("user.shared.lsp-selector.web").judge

return create_setup(function()
  return {
    root_dir = function(bufnr, cb)
      if node_or_deno(bufnr).type == "node" then
        cb(node_or_deno(bufnr).root)
      end
    end,
  }
end)
