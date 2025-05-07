local create_setup = require("user.lsp.config-builder").create_setup

return create_setup {
  root_dir = function(bufnr, cb)
    local venv = vim.fs.root(bufnr, { ".venv" })
    if venv ~= nil then
      cb(venv)
      return
    end

    cb(vim.fs.root(bufnr, { "pyproject.toml", "requirements.txt" }))
  end,
}
