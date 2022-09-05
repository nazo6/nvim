local create_config = require("config.plugin.lsp.utils").create_config

return function(server)
  local config = create_config {}

  require("ionide").setup(config)
end
