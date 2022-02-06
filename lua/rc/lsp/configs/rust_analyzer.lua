local create_config = require("rc.lsp.utils").create_config

return function(server)
  local config = create_config {}

  require("rust-tools").setup {
    server = vim.tbl_deep_extend("force", server:get_default_options(), config),
  }
  server:attach_buffers()
end
