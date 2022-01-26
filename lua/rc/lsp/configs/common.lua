local autocmd = require "utils.autocmd"

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

return {
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach()

    require("mapx").group({ silent = true, buffer = bufnr }, function()
      nnoremap("gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")
      nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
      nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
      nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
      nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")

      nnoremap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")

      nnoremap("C-n", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
      nnoremap("C-p", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

      nnoremap("<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>")
      nnoremap("<leader>ca", "<cmd>CodeActionMenu<CR>")
      vnoremap("<leader>ca", "<cmd>CodeActionMenu<CR>")
      nnoremap("<leader>e", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")

      nnoremap("[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
      nnoremap("]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")

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
}
