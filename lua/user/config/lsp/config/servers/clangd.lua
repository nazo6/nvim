local create_setup = require("user.config.lsp.config.utils").create_setup

return create_setup {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
