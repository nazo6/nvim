return {
  name = "typst watch this file",
  priority = 40,
  builder = function()
    local filename = vim.fn.expand "%:t"
    local pdfname = vim.fn.expand "%:t:r" .. ".pdf"

    return {
      cmd = { "typst" },
      args = { "watch", filename, pdfname },
      cwd = vim.fn.expand "%:p:h",
    }
  end,
  condition = {
    filetype = { "typst" },
  },
}
