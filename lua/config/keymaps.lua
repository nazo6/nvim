vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("n", "gk", "k", { silent = true })
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "gj", "j", { silent = true })

vim.keymap.set("n", "<S-h>", "^", { silent = true })
vim.keymap.set("n", "<S-l>", "$", { silent = true })

vim.keymap.set("n", "<S-Right>", "<C-w><", { silent = true })
vim.keymap.set("n", "<S-Left>", "<C-w>>", { silent = true })
vim.keymap.set("n", "<S-Up>", "<C-w>+", { silent = true })
vim.keymap.set("n", "<S-Down>", "<C-w>-", { silent = true })

vim.keymap.set("v", "c", [["_c]], { silent = true })
vim.keymap.set("v", "p", [[_dp]], { silent = true })

vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<CR>", { silent = true })

vim.keymap.set("n", "<C-s>", [[:%s/]], { silent = true })

vim.keymap.set("n", "<leader>sp", "<cmd>PackerStatus<CR>")
vim.keymap.set("n", "<leader>sl", "<cmd>LuaCacheProfile<CR>")

vim.keymap.set("n", "s", "<C-w>", { noremap = false })
