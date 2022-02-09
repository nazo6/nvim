local dap = require "dap"

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { require("installer/integrations/da").get "node2" },
}
dap.configurations.typescript = {
  {
    type = "node2",
    request = "attach",
    name = "Attach node",
  },
}

nnoremap("<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true })
nnoremap("<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true })
nnoremap("<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
nnoremap("<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
nnoremap("<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
nnoremap("<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
nnoremap("<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
nnoremap("<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true })
nnoremap("<leader>l", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = true })

require("nvim-dap-virtual-text").setup()
require("dapui").setup()
