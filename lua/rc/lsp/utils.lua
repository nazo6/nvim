local common_config = require "rc.lsp.configs.common"
return {
  setup = function(server_config, server)
    local config
    local setup
    if server_config ~= nil then
      if server_config.setup ~= nil then
        config = server_config.config or {}
        setup = function(opts)
          server_config.setup(server, opts)
        end
      else
        config = server_config
        setup = function(opts)
          server:setup(opts)
        end
      end

      local server_on_attach = config.on_attach
      config.on_attach = function(client, bufnr)
        if server_on_attach ~= nil then
          server_on_attach(client, bufnr)
        end
        common_config.on_attach(client, bufnr)
      end
      config.capabilities = common_config.capabilities
    else
      config = common_config
      setup = function(opts)
        server:setup(opts)
      end
    end
    setup(config)
  end,
}
