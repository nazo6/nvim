local autocmd = require "utils.autocmd"

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

return {
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach()
    require("aerial").on_attach(client, bufnr)

    require("mapx").group({ silent = true, buffer = bufnr }, function()
      nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
      nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
      nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
      nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")

      nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")

      nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
      nnoremap(" leader>ca", "<cmd>CodeActionMenu<CR>")
      vnoremap("<leader>ca", "<cmd>CodeActionMenu<CR>")
      nnoremap("<leader>e", "<cmd>lua vim.diagnostic.open_float(0,{border='rounded'})<CR>")

      nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

      nnoremap("<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
      nnoremap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
      nnoremap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
      nnoremap("<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
    end)

    autocmd {
      id = "LspFormat",
      events = "BufWritePre",
      bufonly = true,
      command = function()
        vim.lsp.buf.formatting_sync({}, 7000)
      end,
    }
  end,
  capabilities = capabilities,
  handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  },
}
