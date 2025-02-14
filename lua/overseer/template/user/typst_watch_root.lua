local utils = require "user.shared.utils.typst"

return {
  name = "typst watch root",
  priority = 39,
  builder = function()
    local fname = vim.api.nvim_buf_get_name(0)
    local root_dir = utils.get_typst_root_dir(fname)
    local main_file = utils.get_typst_main_file(fname)

    if main_file == nil then
      return false, "Failed to find main typ file."
    end

    local pdf_file = vim.fn.fnamemodify(main_file, ":r") .. ".pdf"

    local args = { "watch", main_file, pdf_file }

    if root_dir == nil then
      root_dir = vim.fs.dirname(main_file)
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
