tnoremap("<ESC>", "<C-\\><C-n>")

nnoremap("<C-t>n", "<cmd>ToggleTerm<CR>", "silent")
nnoremap("<C-t>h", "<C-n><cmd>ToggleTermToggleAll<CR>", "silent")
tnoremap("<C-t>h", "<C-\\><C-n><cmd>ToggleTermToggleAll<CR>", "silent")

local gitui = require("toggleterm.terminal").Terminal:new {
  cmd = require("installer.integrations.tools").get "gitui",
  direction = "float",
  hidden = true,
}
nnoremap("<leader>g", function()
  gitui:toggle()
end, "silent")

require("toggleterm").setup {
  hide_numbers = false,
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  close_on_exit = true,
  shell = vim.fn.has "win32" == 1 and "pwsh.exe" or vim.o.shell,
}
