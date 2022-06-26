local s = vim.keymap.set

s("n", "k", "gk", { silent = true })
s("n", "gk", "k", { silent = true })
s("n", "j", "gj", { silent = true })
s("n", "gj", "j", { silent = true })

s("n", "<S-h>", "^", { silent = true })
s("n", "<S-l>", "$", { silent = true })

s("n", "<S-Right>", "<C-w><", { silent = true })
s("n", "<S-Left>", "<C-w>>", { silent = true })
s("n", "<S-Up>", "<C-w>+", { silent = true })
s("n", "<S-Down>", "<C-w>-", { silent = true })

s("v", "c", [["_c]], { silent = true })
s("v", "p", [[_dp]], { silent = true })

s("n", "<Esc><Esc>", "<cmd>noh<CR>", { silent = true })

s("n", "<C-s>", [[:%s/]], { silent = true })

s("n", "<leader>sp", "<cmd>PackerStatus<CR>")
s("n", "<leader>sl", "<cmd>LuaCacheProfile<CR>")

s("n", "s", "<C-w>", { noremap = false })

s("n", "<leader>q", "<cmd>q<CR>")
