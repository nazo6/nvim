local lsp_format = function(c)
  local config = c or {}
  local null_ls_sources = require "null-ls.sources"
  local ft = vim.bo.filetype

  local has_null_ls = #null_ls_sources.get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format(vim.tbl_deep_extend("force", config, {
    filter = function(client)
      if has_null_ls then
        return client.name == "null-ls"
      else
        return true
      end
    end,
  }))
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ctx)
    local map = vim.keymap.set
    local client = vim.lsp.get_client_by_id(ctx.data.client_id)
    local bufnr = ctx.buf

    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end

    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr })
    map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
    map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })

    map("n", "gd", "<cmd>Glance definitions<CR>", { buffer = bufnr })
    map("n", "gr", "<cmd>Glance references<CR>", { buffer = bufnr })

    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })

    map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr })
    map({ "n", "v" }, "<leader>ca", [[<cmd>lua require("actions-preview").code_actions()<CR>]], { buffer = bufnr })
    map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0,{border='rounded'})<CR>", { buffer = bufnr })
    -- map("n", "<leader>d", function()
    --   local virtual_lines_enabled = not vim.diagnostic.config().virtual_lines
    --   vim.diagnostic.config { virtual_lines = virtual_lines_enabled, virtual_text = not virtual_lines_enabled }
    -- end, { buffer = bufnr })

    map("n", "<leader>f", function()
      lsp_format()
    end, { buffer = bufnr })

    map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = bufnr })
    map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = bufnr })
    map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = bufnr })
    map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { buffer = bufnr })

    vim.api.nvim_create_augroup("LspFormat" .. bufnr, {})
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      group = "LspFormat" .. bufnr,
      buffer = bufnr,
      callback = function()
        lsp_format { timeout_ms = 7000, async = false }
      end,
    })
  end,
})
