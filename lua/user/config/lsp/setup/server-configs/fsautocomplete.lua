local create_config = require("user.config.lsp.setup.config-builder").create_config

return function(server)
  require("ionide").setup(create_config())
end
