return {
  name = "typst watch root",
  priority = 39,
  builder = function()
    local util = require "lspconfig.util"

    local index_file_root_pattern = util.root_pattern "report.typ"
    local root_dir = index_file_root_pattern(vim.api.nvim_buf_get_name(0))
    if root_dir == nil then
      return false, "Failed to find index typ file."
    end
    local root_file = vim.fs.joinpath(root_dir, "report.typ")
    local pdf_file = vim.fn.fnamemodify(root_file, ":r") .. ".pdf"

    local args = { "watch", root_file, pdf_file }

    local root_dir = util.find_git_ancestor(root_file)
    if root_dir == nil then
      root_dir = util.path.dirname(root_file)
    end

    table.insert(args, "--root")
    table.insert(args, root_dir)

    return {
      cmd = { "typst" },
      args = args,
      cwd = vim.fn.expand "%:p:h",
    }
  end,
  condition = {
    filetype = { "typst" },
  },
}
