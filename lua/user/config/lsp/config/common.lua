vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ctx)
    local client = vim.lsp.get_client_by_id(ctx.data.client_id)
    local bufnr = ctx.buf

    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end

    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = true })
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = true })
    vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = true })

    vim.keymap.set("n", "gd", "<cmd>Glance definitions<CR>", { buffer = true })
    vim.keymap.set("n", "gr", "<cmd>Glance references<CR>", { buffer = true })

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = true })

    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = true })
    vim.keymap.set(
      { "n", "v" },
      "<leader>ca",
      [[<cmd>lua require("actions-preview").code_actions()<CR>]],
      { buffer = true }
    )
    vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0,{border='rounded'})<CR>", { buffer = true })
    vim.keymap.set("n", "<leader>d", function()
      local virtual_lines_enabled = not vim.diagnostic.config().virtual_lines
      vim.diagnostic.config { virtual_lines = virtual_lines_enabled, virtual_text = not virtual_lines_enabled }
    end, { buffer = true })

    vim.keymap.set(
      "n",
      "<leader>f",
      "<cmd>lua vim.lsp.buf.format({ timeout_ms = 7000, async = true })<CR>",
      { buffer = true }
    )

    vim.keymap.set("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = true })
    vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = true })
    vim.keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = true })
    vim.keymap.set(
      "n",
      "<leader>wl",
      "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
      { buffer = true }
    )

    vim.api.nvim_create_augroup("LspFormat" .. bufnr, {})
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      group = "LspFormat" .. bufnr,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { timeout_ms = 7000, async = false }
      end,
    })
  end,
})

local client_capabilities = require("cmp_nvim_lsp").default_capabilities()
client_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
client_capabilities.textDocument.colorProvider = {
  dynamicRegistration = true,
}

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  local util = require "vim.lsp.util"

  config = config or {}
  config.border = "rounded"
  config.focus_id = ctx.method

  if not (result and result.contents) then
    return
  end
  local markdown_lines = util.convert_input_to_markdown_lines(result.contents, {})
  markdown_lines = util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  if #markdown_lines == 1 and markdown_lines[1] == "" then
    return
  end
  return util.open_floating_preview(markdown_lines, "markdown", config)
end
