local util = require "lspconfig.util"
local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

return create_setup {
  root_dir = function(fname)
    local root = util.find_git_ancestor(fname)
    if root == nil then
      root = util.path.dirname(fname)
    end
    return root
  end,
  settings = {
    exportPdf = "onSave",
  },
}
