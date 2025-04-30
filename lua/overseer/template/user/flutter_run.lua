return {
  name = "flutter run",
  priority = 39,
  builder = function()
    local root_dir = vim.fs.root(0, "pubspec.yaml")
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
