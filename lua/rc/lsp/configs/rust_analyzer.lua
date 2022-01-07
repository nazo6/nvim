return function(server)
  local config = {}

  require("rust-tools").setup {
    server = vim.tbl_deep_extend("force", server:get_default_options(), config),
  }
  server:attach_buffers()
end
