local create_config = require("rc.lsp.utils").create_config
local root_pattern = require("lspconfig").util.root_pattern

local node_root_pattern = root_pattern("package.json", "tsconfig.json")
local deno_root_pattern = root_pattern("deno.json", "deps.ts")

return function(server)
  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local is_node_repo = node_root_pattern(bufname, bufnr) ~= nil
  local is_deno_repo = deno_root_pattern(bufname, bufnr) ~= nil

  local config = create_config {
    autostart = not is_node_repo or is_deno_repo,
    root_dir = deno_root_pattern,
    single_file_support = true,
    init_options = {
      enable = true,
      lint = true,
      unstable = true,
    },
  }

  server:setup(config)
end
