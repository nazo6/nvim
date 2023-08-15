vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ctx)
    local map = vim.keymap.set
    local client = vim.lsp.get_client_by_id(ctx.data.client_id)
    local bufnr = ctx.buf

    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end
    -- require("lsp-inlayhints").on_attach(client, bufnr)

    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr })
    map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
    map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })

    map("n", "gd", "<cmd>Glance definitions<CR>", { buffer = bufnr })
    map("n", "gr", "<cmd>Glance references<CR>", { buffer = bufnr })

    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })

    map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr })
    map({ "n", "v" }, "<leader>ca", [[<cmd>lua require("actions-preview").code_actions()<CR>]], { buffer = bufnr })
    map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0,{border='rounded'})<CR>", { buffer = bufnr })
    map("n", "<leader>td", [[<cmd>lua require("lsp_lines").toggle()<CR>]], { buffer = bufnr })


    map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = bufnr })
    map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = bufnr })
    map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = bufnr })
    map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { buffer = bufnr })
  end,
})
