require('flutter-tools').setup {
  ui = { border = 'rounded' },
  flutter_path = 'C:\\flutter\\bin\\flutter.bat',
  debugger = { enabled = true },
  widget_guides = { enabled = true },
  closing_tags = { highlight = 'ErrorMsg', prefix = '>', enabled = true },
  dev_log = { open_cmd = 'tabedit' },
  dev_tools = { autostart = true, autoopen_browser = true },
  outline = { open_cmd = '30vnew' },
  lsp = { settings = { showTodos = true, completeFunctionCalls = true } },
}
