local create_config = require("user.lsp.config-builder").create_config

return function(server)
  require("ionide").setup(create_config())
end
