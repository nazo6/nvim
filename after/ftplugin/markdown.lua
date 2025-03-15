local ext = vim.fn.fnamemodify(vim.fn.bufname(), ":e")

if ext == "ipynb" then
  require("quarto").activate()
  local runner = require "quarto.runner"

  vim.keymap.set("n", "<leader>ip", function()
    vim.cmd "MoltenInit python3"
  end, { desc = "Initialize Molten for python3", buffer = true })
  vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = true, buffer = true })
end
