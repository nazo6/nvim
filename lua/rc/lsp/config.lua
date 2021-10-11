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
    nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    nnoremap("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    nnoremap("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    nnoremap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    nnoremap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    nnoremap("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    nnoremap("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    nnoremap("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    nnoremap("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    nnoremap("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    nnoremap("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    nnoremap("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    autocmd {
      id = "LspFormat",
      events = "BufWritePre",
      bufonly = true,
      command = function()
        vim.lsp.buf.formatting_sync()
      end,
    }
  end,
  capabilities = capabilities,
}
