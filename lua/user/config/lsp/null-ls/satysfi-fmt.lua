local null_ls = require "null-ls"
local helpers = require "null-ls.helpers"

return {
  name = "satysfi_fmt",
  method = null_ls.methods.FORMATTING,
  filetypes = { "satysfi" },
  -- null_ls.generator creates an async source
  -- that spawns the command with the given arguments and options
  generator = helpers.formatter_factory {
    command = "satysfi-fmt",
    args = { "$FILENAME", "-w" },
    to_temp_file = true,
    from_temp_file = true,
    to_stdin = false,
  },
}
