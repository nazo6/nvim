return {
  name = "gnuplot",
  priority = 40,
  builder = function()
    local filename = vim.fn.expand "%:t"

    return {
      cmd = { "gnuplot" },
      args = { filename },
      cwd = vim.fn.expand "%:p:h",
    }
  end,
  condition = {
    filetype = { "gp" },
  },
}
