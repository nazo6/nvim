_G.term_gitui = nil
_G.toggle_gitui = function()
  if term_gitui == nil then
    _G.term_gitui = require("toggleterm.terminal").Terminal:new {
      cmd = require("installer.integrations.tools").get "gitui",
      direction = "float",
      hidden = true,
    }
  end
  term_gitui:toggle()
end

return {
  setup = function()
    nnoremap([[<c-\>]], '<cmd>execute v:count . "ToggleTerm"<cr>', "silent")
    tnoremap([[<c-\>]], "<cmd>ToggleTerm<cr>", "silent")
    tnoremap("<ESC>", "<C-\\><C-n>")

    nnoremap("<C-t>h", "<C-n><cmd>ToggleTermToggleAll<CR>", "silent")
    tnoremap("<C-t>h", "<C-\\><C-n><cmd>ToggleTermToggleAll<CR>", "silent")

    nnoremap("<leader>g", "<cmd>lua _G.toggle_gitui()<CR>", "silent")
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
