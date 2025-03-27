vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ctx)
    local map = vim.keymap.set
    local client = vim.lsp.get_client_by_id(ctx.data.client_id)
    assert(client, "No client found")
    local bufnr = ctx.buf

    if client.name == "copilot" then
      return
    end

    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end

    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr, desc = "[LSP] Go implementation" })

    map("n", "gd", "<cmd>Glance definitions<CR>", { buffer = bufnr, desc = "[LSP] Go definitions" })
    map(
      "n",
      "gD",
      "<cmd>lua vim.lsp.buf.definition()<CR>",
      { buffer = bufnr, desc = "[LSP] Go definitions using builtin func" }
    )
    map("n", "gr", "<cmd>Glance references<CR>", { buffer = bufnr, desc = "[LSP] Go references" })

    map("n", "K", "<cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>", { buffer = bufnr, desc = "[LSP] Hover" })
    map(
      { "n", "i" },
      "<C-s>",
      "<cmd>lua vim.lsp.buf.signature_help({border='rounded'})<CR>",
      { buffer = bufnr, desc = "[LSP] Signature help" }
    )

    map(
      "n",
      "<leader>rn",
      "<cmd>lua vim.lsp.buf.rename({border='rounded'})<CR>",
      { buffer = bufnr, desc = "[LSP] Rename" }
    )
    map(
      { "n", "v" },
      "<leader>ca",
      [[<cmd>lua require("actions-preview").code_actions()<CR>]],
      { buffer = bufnr, desc = "[LSP] Code actions" }
    )
    map(
      "n",
      "<leader>e",
      "<cmd>lua vim.diagnostic.open_float(0,{border='rounded'})<CR>",
      { buffer = bufnr, desc = "[LSP] Show diagnostics" }
    )

    map(
      "n",
      "<leader>q",
      "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
      { buffer = bufnr, desc = "[LSP] Set loclist" }
    )
  end,
})
