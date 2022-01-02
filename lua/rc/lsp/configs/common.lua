local lsp_status = require "lsp-status"
lsp_status.config {
  diagnostics = false,
}
lsp_status.register_progress()

local autocmd = require "utils.autocmd"

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)

return {
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach()
    lsp_status.on_attach(client)

    local opts = { silent = true, buffer = bufnr }
    nnoremap("gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
    nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts, "LSP: Go declaration")
    nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts, "LSP: Go implementation")
    nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts, "LSP: Go definition")
    -- nnoremap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts, "LSP: Go references")

    nnoremap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)

    nnoremap("C-n", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    nnoremap("C-p", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

    nnoremap("<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts, "LSP: Rename")
    nnoremap("<leader>ca", "<cmd>CodeActionMenu<CR>", opts, "LSP: Open code action menu")
    vnoremap("<leader>ca", "<cmd>CodeActionMenu<CR>", opts, "LSP: Open code action menu")
    nnoremap("<leader>e", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts, "LSP: Show line diagnostics")

    nnoremap("[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
    nnoremap("]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

    nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts, "LSP: Format")

    nnoremap("<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    nnoremap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    nnoremap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    nnoremap("<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

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
