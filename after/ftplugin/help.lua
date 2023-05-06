map("n", "K", function()
  local word = vim.fn.expand "<cword>"
  vim.cmd("help " .. word)
end)
vim.opt_local.number = true
