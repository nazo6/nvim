return {
  setup = function()
    local default_setup = require("user.lsp.config-builder").default_setup

    local function setup_server(server_name)
      local ok, config_fn = pcall(require, "user.lsp.server-configs." .. server_name)
      if not ok then
        config_fn = default_setup
      end
      config_fn(server_name)
    end

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        setup_server(server_name)
      end,
    }

    for _, server_name in ipairs(Args.lsp.local_servers) do
      setup_server(server_name)
    end

    require "user.lsp.attach"
  end,
}
