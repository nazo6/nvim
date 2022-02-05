require("flutter-tools").setup {
  ui = { border = "rounded" },
  debugger = { enabled = true, run_via_dap = true },
  widget_guides = { enabled = true },
  closing_tags = { highlight = "ErrorMsg", prefix = ">", enabled = true },
  dev_log = { open_cmd = "tabedit" },
  dev_tools = { autostart = true, autoopen_browser = true },
  lsp = vim.tbl_extend("force", require("rc.lsp.utils").create_config {}, {
    settings = { showTodos = true, completeFunctionCalls = true },
  }),
}

require "utils.autocmd" {
  id = "FlutterOutlineMap",
  events = "FileType dart,flutterToolsOutline",
  command = function()
    nnoremap("<leader>o", "<cmd>FlutterOutlineToggle<CR>", "buffer")
  end,
}
