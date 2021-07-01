require('flutter-tools').setup({
  ui: {
    border: 'rounded'
  },
  debugger: {
    enabled: true
  },
  flutter_path: 'C:\\flutter\\bin\\flutter.bat',
  widget_guides: {
    enabled: true
  },
  closing_tags: {
    highlight: 'ErrorMsg',
    prefix: '>',
    enabled: false
  },
  dev_log: {
    open_cmd: '20new'
  },
  dev_tools: {
    autostart: true,
    autoopen_browser: true
  },
  outline: {
    open_cmd: '30vnew'
  },
  lsp: {
    settings: {
      showTodos: true,
      completeFunctionCalls: true
    }
  }
});
