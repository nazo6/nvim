_G.term_gitui = nil
_G.toggle_gitui = function()
  if term_gitui == nil then
    _G.term_gitui = require("toggleterm.terminal").Terminal:new {
      cmd = "gitui",
      direction = "float",
      hidden = true,
    }
  end
  term_gitui:toggle()
end

return {
  setup = function()
    vim.keymap.set("n", [[<c-\>]], '<cmd>execute v:count . "ToggleTerm"<cr>', { desc = "[toggleterm] toggle" })
    vim.keymap.set("t", [[<c-\>]], "<cmd>ToggleTerm<cr>", { desc = "[toggleterm] toggle" })
    vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

    vim.keymap.set("n", "<C-t>h", "<C-n><cmd>ToggleTermToggleAll<CR>", { desc = "[toggleterm] Toggle all" })
    vim.keymap.set("t", "<C-t>h", "<C-\\><C-n><cmd>ToggleTermToggleAll<CR>", { desc = "[toggleterm] Toggle all" })

    vim.keymap.set("n", "<leader>g", "<cmd>lua _G.toggle_gitui()<CR>", { desc = "Toggle gitui" })
  end,
  config = function()
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
  end,
}
