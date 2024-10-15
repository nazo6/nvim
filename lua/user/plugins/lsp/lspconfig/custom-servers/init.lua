local custom_servers = {
  satysfi = require "user.plugins.lsp.lspconfig.custom-servers.satysfi",
}

return {
  setup_custom_servers = function()
    for name, server in pairs(custom_servers) do
      require("lspconfig.configs")[name] = {
        default_config = server,
      }
    end
  end,
}
