local create_config = require("user.config.lsp.config.utils").create_config

return function(server)
  local config = create_config {}

  require("ionide").setup(config)
end
