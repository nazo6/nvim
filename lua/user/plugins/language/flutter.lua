return {
  "akinsho/flutter-tools.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  ft = { "dart" },
  enabled = not Args.feature.vscode,
  config = function()
    require("flutter-tools").setup {
      ui = { border = "rounded" },
      debugger = {
        enabled = true,
        run_via_dap = false,
        register_configurations = function(paths)
          if require("user.shared.utils.system").is_win then
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
      lsp = {
        settings = { showTodos = true, completeFunctionCalls = true },
      },
    }

    vim.api.nvim_create_augroup("FlutterOutlineMap", {})
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = "FlutterOutlineMap",
      once = true,
      pattern = { "dart", "flutterToolsOutline" },
      callback = function()
        map("n", "<leader>o", "<cmd>FlutterOutlineToggle<CR>", { buffer = true })
      end,
    })
  end,
}
