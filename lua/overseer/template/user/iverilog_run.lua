return {
  name = "iverilog build and run",
  builder = function()
    local file = vim.fn.expand "%:p"
    local file_basename = vim.fn.fnamemodify(file, ":t:r")
    local output = vim.fn.fnamemodify(vim.fn.expand "%:p:h", ":p") .. file_basename .. ".out"
    return {
      cmd = { "iverilog" },
      args = { file, "-o", output, "&&", output },
      cwd = vim.fn.expand "%:p:h",
    }
  end,
  condition = {
    filetype = { "verilog", "systemverilog" },
  },
}
