local util = require "lspconfig.util"
local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

return create_setup {
  on_attach = function(client, bufnr)
    local typst_utils = require "user.shared.lsp.typst"
    vim.api.nvim_buf_create_user_command(bufnr, "TypstPinCurrent", function()
      typst_utils.pinMain(client, vim.uri_from_bufnr(bufnr))
    end, {})

    vim.api.nvim_buf_create_user_command(bufnr, "TypstPin", function(opts)
      typst_utils.pinMain(client, vim.uri_from_fname(opts.fargs[1]))
    end, { nargs = 1 })

    vim.api.nvim_buf_create_user_command(bufnr, "TypstUnpinCurrent", function()
      typst_utils.unPinMain(client)
    end, {})
  end,
  root_dir = function(fname)
    local root = util.find_git_ancestor(fname)
    if root == nil then
      root = util.path.dirname(fname)
    end
    return root
  end,
  settings = {
    exportPdf = "onSave",
    -- experimentalFormatterMode = "on",
  },
}
