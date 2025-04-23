local create_setup = require("user.lsp.config-builder").create_setup
local node_or_deno = require("user.shared.lsp-selector.web").judge

return create_setup {
  root_dir = function(bufnr, cb)
    if node_or_deno(bufnr).type == "deno" then
      cb(node_or_deno(bufnr).root)
    end
  end,
  settings = {
    enable = true,
    lint = true,
    unstable = true,
  },
  on_attach = function(client)
    client.server_capabilities.executeCommandProvider = true
  end,
}
