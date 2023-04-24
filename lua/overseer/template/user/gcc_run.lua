return {
  name = "gcc build and run",
  builder = function()
    local file = vim.fn.expand "%:p"
    local file_basename = vim.fn.fnamemodify(file, ":t:r")
    local output = vim.fn.fnamemodify(vim.fn.expand "%:p:h", ":p") .. file_basename .. ".out"
    return {
      cmd = { "gcc" },
      args = { file, "-o", output, "-lm", "&&", output },
    }
  end,
  condition = {
    filetype = { "c", "cpp" },
  },
}
