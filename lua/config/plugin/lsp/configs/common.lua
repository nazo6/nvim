local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

return {
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach()
    require("aerial").on_attach(client, bufnr)

    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    vim.keymap.set("n", "<leader>ca", "<cmd>CodeActionMenu<CR>")
    vim.keymap.set("v", "<leader>ca", "<cmd>CodeActionMenu<CR>")
    vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0,{border='rounded'})<CR>")

    vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 7000, async = true })<CR>")

    vim.keymap.set("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
    vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
    vim.keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
    vim.keymap.set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

    vim.api.nvim_create_augroup("LspFormat" .. bufnr, {})
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      group = "LspFormat" .. bufnr,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { timeout_ms = 7000, async = false }
      end,
    })
  end,
  capabilities = capabilities,
  handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  },
}
