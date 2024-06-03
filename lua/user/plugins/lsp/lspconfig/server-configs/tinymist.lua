local util = require "lspconfig.util"
local create_setup = require("user.plugins.lsp.lspconfig.config-builder").create_setup

local pinned = {}

local typst_utils = {
  unPinMain = function(client)
    client.request("workspace/executeCommand", {
      command = "tinymist.doPinMain",
      arguments = { "detached" },
    }, function(err, _result, _ctx)
      if err ~= nil then
        vim.notify("Error unpinning typst-lsp: " .. vim.inspect(error), vim.log.levels.ERROR)
      end
    end)
  end,
  pinMain = function(client, uri)
    local typst_lsp_client = vim.lsp.get_clients {
      name = "tinymist",
    }
    if #typst_lsp_client == 0 then
      vim.notify("No tinymist-lsp found", vim.log.levels.ERROR)
      return
    end
    client.request("workspace/executeCommand", {
      command = "tinymist.doPinMain",
      arguments = { uri },
    }, function(err, _result, _ctx)
      if err ~= nil then
        vim.notify("Error pinning typst-lsp: " .. vim.inspect(error), vim.log.levels.ERROR)
      end
    end)
  end,
}

return create_setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "TypstPinCurrent", function()
      typst_utils.pinMain(client, vim.uri_from_bufnr(bufnr))
    end, {})

    vim.api.nvim_buf_create_user_command(bufnr, "TypstPin", function(opts)
      typst_utils.pinMain(client, vim.uri_from_fname(opts.fargs[1]))
    end, { nargs = 1 })

    vim.api.nvim_buf_create_user_command(bufnr, "TypstUnpinCurrent", function()
      typst_utils.unPinMain(client)
    end, {})

    local root_pattern = require("lspconfig").util.root_pattern
    local index_file_root_pattern = root_pattern "report.typ"
    local root_dir = index_file_root_pattern(vim.api.nvim_buf_get_name(bufnr))
    if root_dir ~= nil then
      local root_file = vim.fs.joinpath(root_dir, "report.typ")
      if not pinned[root_file] then
        vim.defer_fn(function()
          typst_utils.pinMain(client, vim.uri_from_fname(root_file))
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
