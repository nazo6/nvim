local create_config = require("rc.lsp.utils").create_config
local root_pattern = require("lspconfig").util.root_pattern

local node_root_pattern = root_pattern("package.json", "tsconfig.json")

return function(server)
  local is_node_repo = node_root_pattern(bufname, bufnr) ~= nil
  local config = create_config {
    autostart = is_node_repo,
    root_dir = node_root_pattern,
    on_attach = function(client, bufnr)
      -- disable tsserver formatting if you plan on formatting via null-ls
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      local ts_utils = require "nvim-lsp-ts-utils"

      -- defaults
      local prettierd_path = require("installer.integrations.null_ls").get_path "prettierd"
      ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = false,

        -- import all
        import_all_timeout = 5000, -- ms
        import_all_priorities = {
          buffers = 4, -- loaded buffer names
          buffer_content = 3, -- loaded buffer content
          local_files = 2, -- git files or files with relative path markers
          same_file = 1, -- add to existing import statement
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- eslint
        eslint_enable_code_actions = false,
        eslint_enable_disable_comments = false,
        eslint_enable_diagnostics = false,

        -- formatting
        enable_formatting = true,
        formatter = "prettierd",

        formatter_opts = {
          command = prettierd_path,
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
            "css",
            "scss",
            "html",
            "json",
            "jsonc",
            "yaml",
            "markdown",
          },
        },

        -- update imports on file move
        update_imports_on_move = false,
        require_confirmation_on_move = false,
        watch_dir = nil,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {},
      }

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- no default maps, so you may want to define some here
      local opts = { silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end,
  }

  server:setup(config)
end
