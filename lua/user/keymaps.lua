map("n", "k", "gk")
map("n", "gk", "k")
map("n", "j", "gj")
map("n", "gj", "j")

map("n", "<S-h>", "^")
map("n", "<S-l>", "$")

map("n", "<S-Right>", "<C-w><")
map("n", "<S-Left>", "<C-w>>")
map("n", "<S-Up>", "<C-w>+")
map("n", "<S-Down>", "<C-w>-")

map({ "n", "x" }, "c", [["_c]])
map({ "n", "x" }, "d", [["_d]])

map("n", "<C-s>", [[:%s/]])

map("n", "<A-v>", "<C-w><C-v>")
map("n", "<A-s>", "<C-w><C-s>")

map("n", "<leader>q", "<cmd>q<CR>")
map("n", "<leader>w", "<cmd>w<CR>")

map("n", "<esc>", function()
  if vim.api.nvim_win_get_config(0).zindex then
    vim.cmd [[quit]]
  end
end, {
  desc = "close window if it's a popup",
})

map("n", "K", "<Nop>")
map("n", "<C-c>", "<Nop>")

map("n", "<leader>f", "<cmd>silent! !explorer.exe .<CR>")

map("n", "<leader>r", function()
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
  end, {})
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end)
