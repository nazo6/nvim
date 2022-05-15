require("flutter-tools").setup {
  ui = { border = "rounded" },
  debugger = {
    enabled = true,
    run_via_dap = true,
    register_configurations = function(paths)
      if require("config.utils").is_win then
        require("dap").adapters.dart = {
          command = paths.dart_sdk .. "\\bin\\dart.exe",
          args = {
            "--disable-dart-dev",
            "--packages=" .. paths.flutter_sdk .. "\\packages\\flutter_tools\\.packages",
            paths.flutter_sdk .. "\\bin\\cache\\flutter_tools.snapshot",
            "debug-adapter",
          },
          options = {
            initialize_timeout_sec = 10,
          },
          type = "executable",
        }
      end

      require("dap").configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = paths.dart_sdk,
          flutterSdkPath = paths.flutter_sdk,
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
          args = { "-d", "windows" },
        },
        {
          type = "dart",
          request = "attach",
          name = "Connect flutter",
          dartSdkPath = paths.dart_sdk,
          flutterSdkPath = paths.flutter_sdk,
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },
  widget_guides = { enabled = true },
  closing_tags = { prefix = ">", enabled = true },
  dev_log = { open_cmd = "tabedit" },
  dev_tools = {
    autostart = true,
    autoopen_browser = true,
  },
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
