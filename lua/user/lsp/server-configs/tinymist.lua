local create_setup = require("user.lsp.config-builder").create_setup
local utils = require "user.shared.utils.typst"

local pinned = {}

local typst_utils = {
  --- @param client vim.lsp.Client
  unPinMain = function(client, bufnr)
    client:exec_cmd({
      title = "unpin",
      command = "tinymist.pinMain",
      arguments = { vim.v.null },
    }, { bufnr = bufnr })
  end,

  --- @param client vim.lsp.Client
  pinMain = function(client, bufnr, path)
    client:exec_cmd({
      title = "pin",
      command = "tinymist.pinMain",
      arguments = { path },
    }, { bufnr = bufnr })
  end,
}

return create_setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "TypstPinCurrent", function()
      typst_utils.pinMain(client, bufnr, vim.api.nvim_buf_get_name(0))
    end, {})

    vim.api.nvim_buf_create_user_command(bufnr, "TypstPin", function(opts)
      typst_utils.pinMain(client, bufnr, opts.fargs[1])
    end, { nargs = 1 })

    vim.api.nvim_buf_create_user_command(bufnr, "TypstUnpin", function()
      typst_utils.unPinMain(client)
    end, {})

    local root_file = utils.get_typst_main_file(vim.api.nvim_buf_get_name(bufnr))
    if root_file ~= nil then
      if not pinned[root_file] then
        vim.defer_fn(function()
          typst_utils.pinMain(client, bufnr, root_file)
          pinned[root_file] = true
          vim.notify("[tinymist] Pinned to " .. root_file)
        end, 1000)
      end
    end
  end,
  root_dir = function(bufnr, cb)
    cb(utils.get_typst_root_dir(vim.api.nvim_buf_get_name(bufnr)))
  end,
  settings = {
    formatterMode = "typstyle",
    compileStatus = "enable",
  },
}
