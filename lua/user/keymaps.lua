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
    vim.cmd [[close]]
  end
end, {
  desc = "close window if it's a popup",
})

set("n", "K", "<Nop>")
