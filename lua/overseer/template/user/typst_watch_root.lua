return {
  name = "typst watch root",
  priority = 39,
  builder = function()
    local root_pattern = require("lspconfig").util.root_pattern
    local index_file_root_pattern = root_pattern "report.typ"
    local root_dir = index_file_root_pattern(vim.api.nvim_buf_get_name(0))
    if root_dir == nil then
      return false, "Failed to find index typ file."
    end
    local root_file = vim.fs.joinpath(root_dir, "report.typ")
    local pdf_file = vim.fn.fnamemodify(root_file, ":r") .. ".pdf"

    return {
      cmd = { "typst" },
      args = { "watch", root_file, pdf_file },
      cwd = vim.fn.expand "%:p:h",
    }
  end,
  condition = {
    filetype = { "typst" },
  },
}
