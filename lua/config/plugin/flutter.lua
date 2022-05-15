require("flutter-tools").setup {
  ui = { border = "rounded" },
  debugger = { enabled = true, run_via_dap = true },
  widget_guides = { enabled = true },
  closing_tags = { prefix = ">", enabled = true },
  dev_log = { open_cmd = "tabedit" },
  dev_tools = { autostart = true, autoopen_browser = true },
  lsp = vim.tbl_extend("force", require("config.plugin.lsp.utils").create_config {}, {
    settings = { showTodos = true, completeFunctionCalls = true },
  }),
}

vim.api.nvim_create_augroup("FlutterOutlineMap", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "FlutterOutlineMap",
  pattern = { "dart", "flutterToolsOutline" },
  callback = function()
    nnoremap("<leader>o", "<cmd>FlutterOutlineToggle<CR>", "buffer")
  end,
})
