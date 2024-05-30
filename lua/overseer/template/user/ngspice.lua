return {
  name = "ngspice load",
  builder = function()
    local file = vim.fn.expand "%:p"
    return {
      cmd = { "ngspice" },
      args = { file },
      cwd = vim.fn.expand "%:p:h",
    }
  end,
  condition = {
    filetype = { "ngspice" },
  },
}
