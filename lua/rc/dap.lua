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

vim.cmd [[
nnoremap <Space>dG <Cmd>lua require'dap'.run_last()<CR>
nnoremap <Space>dg <Cmd>lua require'dap'.run()<CR>
nnoremap <Space>dl <Cmd>lua require'dap'.load_launchjs()<CR>
nnoremap <Space>dB <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <Space>dR <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <Space>do <Cmd>lua require'dap'.step_out()<CR>
nnoremap <Space>di <Cmd>lua require'dap'.step_into()<CR>
nnoremap <Space>dn <Cmd>lua require'dap'.step_over()<CR>
nnoremap <Space>dc <Cmd>lua require'dap'.continue()<CR>
nnoremap <Space>db <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <Space>d<Esc> <Cmd>lua require'dap'.stop()<CR>
]]

require("dapui").setup()
