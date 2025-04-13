local create_setup = require("user.lsp.config-builder").create_setup
local node_or_deno = require("user.shared.lsp-selector.web").judge

return create_setup {
  root_dir = function(path)
    vim.print(path)
    vim.print(node_or_deno(path))
    if node_or_deno(path).type == "deno" then
      return node_or_deno(path).root
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
