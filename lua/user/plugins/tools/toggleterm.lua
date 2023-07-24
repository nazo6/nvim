_G.term_lazygit = nil
_G.toggle_lazygit = function()
  if term_lazygit == nil then
    _G.term_lazygit = require("toggleterm.terminal").Terminal:new {
      cmd = "lazygit",
      direction = "float",
      hidden = true,
      start_in_insert = true,
      on_create = function(term)
        vim.api.nvim_win_set_option(term.window, "scrolloff", 0)
        vim.api.nvim_win_set_option(term.window, "sidescrolloff", 0)
      end,
      on_exit = function(t)
        vim.api.nvim_buf_delete(t.bufnr, { force = true })
        _G.term_lazygit = nil
      end,
    }
  end
  term_lazygit:toggle()
end

return {
  "akinsho/toggleterm.nvim",

  cmd = { "ToggleTerm", "ToggleTermOpen" },
  init = function()
    map("n", [[<c-\>]], '<cmd>execute v:count1 . "ToggleTerm"<cr>', { desc = "[toggleterm] toggle" })
    map("t", [[<c-\>]], "<cmd>ToggleTerm<cr>", { desc = "[toggleterm] toggle" })
    map("t", "<ESC>", "<C-\\><C-n>")

    map("n", "<C-t>h", "<C-n><cmd>ToggleTermToggleAll<CR>", { desc = "[toggleterm] Toggle all" })
    map("t", "<C-t>h", "<C-\\><C-n><cmd>ToggleTermToggleAll<CR>", { desc = "[toggleterm] Toggle all" })

    map("n", "<C-g><C-l>", "<cmd>lua _G.toggle_lazygit()<CR>", { desc = "Toggle lazygit" })

    local termau = vim.api.nvim_create_augroup("terminal", { clear = true })
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      group = termau,
      callback = function()
        map("n", "q", [[<cmd>q<CR>]], { buffer = 0, desc = "Quit terminal buffer" })
      end,
    })
  end,
  config = function()
    require("toggleterm").setup {
      hide_numbers = false,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = false,
      shell = vim.fn.has "win32" == 1 and "pwsh.exe" or vim.o.shell,
    }
  end,
}
