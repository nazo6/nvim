local dap = require "dap"

dap.adapters.node2 = {
  type = "executable",
  command = "node",
}
dap.configurations.typescript = {
  {
    type = "node2",
    request = "attach",
    name = "Attach node",
  },
}

--[[
vim.keymap.set("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true })
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true })
]]

require("nvim-dap-virtual-text").setup {}
-- require("dapui").setup()
