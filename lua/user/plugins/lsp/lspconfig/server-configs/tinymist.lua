local util = require "lspconfig.util"
local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

local pinned = {}

local typst_utils = {
  unPinMain = function(client)
    vim.lsp.buf.execute_command { command = "tinymist.pinMain", arguments = { nil } }
  end,
  pinMain = function(client, path)
    vim.lsp.buf.execute_command { command = "tinymist.pinMain", arguments = { path } }
  end,
}

return create_setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "TypstPinCurrent", function()
      typst_utils.pinMain(client, vim.api.nvim_buf_get_name(0))
    end, {})

    vim.api.nvim_buf_create_user_command(bufnr, "TypstPin", function(opts)
      typst_utils.pinMain(client, opts.fargs[1])
    end, { nargs = 1 })

    vim.api.nvim_buf_create_user_command(bufnr, "TypstUnpin", function()
      typst_utils.unPinMain(client)
    end, {})

    local root_pattern = require("lspconfig").util.root_pattern
    local index_file_root_pattern = root_pattern "report.typ"
    local root_dir = index_file_root_pattern(vim.api.nvim_buf_get_name(bufnr))
    if root_dir ~= nil then
      local root_file = vim.fs.joinpath(root_dir, "report.typ")
      if not pinned[root_file] then
        vim.defer_fn(function()
          typst_utils.pinMain(client, root_file)
          pinned[root_file] = true
          vim.notify("[tinymist] Pinned to " .. root_file)
        end, 1000)
      end
    end
  end,
  root_dir = function(fname)
    local root = util.find_git_ancestor(fname)
    if root == nil then
      root = util.path.dirname(fname)
    end
    return root
  end,
  settings = {
    formatterMode = "typstyle",
    compileStatus = "disable",
  },
}
