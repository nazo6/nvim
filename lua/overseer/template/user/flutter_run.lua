return {
  name = "flutter run",
  priority = 39,
  builder = function()
    local root_pattern = require("lspconfig").util.root_pattern
    local pubspec_root_pat = root_pattern "pubspec.yaml"
    local root_dir = pubspec_root_pat(vim.api.nvim_buf_get_name(0))
    if root_dir == nil then
      return false, "Failed to find pubspec.yaml"
    end
    return {
      cmd = { "flutter" },
      args = { "run" },
      cwd = vim.fn.expand(root_dir),
    }
  end,
  condition = {
    filetype = { "dart" },
  },
}
