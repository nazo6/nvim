_G.__toggleterm_lazy_cmds = {}
local function create_toggle_lazy(cmd)
  return function()
    if __toggleterm_lazy_cmds[cmd] == nil then
      __toggleterm_lazy_cmds[cmd] = require("toggleterm.terminal").Terminal:new {
        cmd = cmd,
        direction = "float",
        hidden = true,
        start_in_insert = true,
        on_create = function(term)
          vim.api.nvim_set_option_value("scrolloff", 0, { win = term.window })
          vim.api.nvim_set_option_value("sidescrolloff", 0, { win = term.window })
        end,
        on_exit = function(t)
          vim.api.nvim_buf_delete(t.bufnr, { force = true })
          _G.term_lazygit = nil
        end,
      }
    end
    __toggleterm_lazy_cmds[cmd]:toggle()
  end
end

local toggle_lazygit = create_toggle_lazy "lazygit"
local toggle_gitui = create_toggle_lazy "gitui"

return {
  "akinsho/toggleterm.nvim",

  cmd = { "ToggleTerm", "ToggleTermOpen" },
  init = function()
    map("n", [[<c-\>]], '<cmd>execute v:count1 . "ToggleTerm"<cr>', { desc = "[toggleterm] toggle" })
    map("t", [[<c-\>]], "<cmd>ToggleTerm<cr>", { desc = "[toggleterm] toggle" })
    map("t", "<ESC>", "<C-\\><C-n>")

    map("n", "<C-g><C-l>", function() toggle_lazygit() end, { desc = "Toggle lazygit" })
    map("n", "<C-g><C-g>", function() toggle_gitui() end, { desc = "Toggle gitui" })

    local termau = vim.api.nvim_create_augroup("terminal", { clear = true })
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      group = termau,
      callback = function() map("n", "q", [[<cmd>q<CR>]], { buffer = 0, desc = "Quit terminal buffer" }) end,
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
      shell = function()
        local shell = require("user.utils").is_win and "cmd.exe /c nu.exe" or vim.o.shell
        return shell
      end,
    }
  end,
}
