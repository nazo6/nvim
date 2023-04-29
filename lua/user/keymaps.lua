local set = vim.keymap.set

set("n", "k", "gk")
set("n", "gk", "k")
set("n", "j", "gj")
set("n", "gj", "j")

set("n", "<S-h>", "^")
set("n", "<S-l>", "$")

set("n", "<S-Right>", "<C-w><")
set("n", "<S-Left>", "<C-w>>")
set("n", "<S-Up>", "<C-w>+")
set("n", "<S-Down>", "<C-w>-")

set({ "n", "x" }, "c", [["_c]])
set({ "n", "x" }, "d", [["_d]])

set("n", "<C-s>", [[:%s/]])

set("n", "<A-v>", "<C-w><C-v>")
set("n", "<A-s>", "<C-w><C-s>")

set("n", "<leader>q", "<cmd>q<CR>")
set("n", "<leader>w", "<cmd>w<CR>")

set("n", "<esc>", function()
  if vim.api.nvim_win_get_config(0).zindex then
    vim.cmd [[quit]]
  end
end, {
  desc = "close window if it's a popup",
})

set("n", "K", "<Nop>")
set("n", "<C-c>", "<Nop>")

set("n", "<leader>f", "<cmd>silent! !explorer.exe .<CR>")

set("n", "<leader>r", function()
  local Input = require "nui.input"
  local event = require("nui.utils.autocmd").event
  local input = Input({
    position = "50%",
    relative = "editor",
    size = {
      width = 50,
    },
    border = {
      style = "rounded",
      text = {
        top = "Restarting neovim. OK? (Y/N)",
        top_align = "center",
      },
    },
  }, {
    on_submit = function(value)
      if value:lower() == "y" then
        vim.cmd [[Restart]]
      end
    end,
  })
  input:mount()
  input:map("i", "<Esc>", function()
    input:unmount()
  end)
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end)
