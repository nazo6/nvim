nnoremap("k", "gk", "silent")
nnoremap("gk", "k", "silent")
nnoremap("j", "gj", "silent")
nnoremap("gj", "j", "silent")

nnoremap("<S-h>", "^", "silent")
nnoremap("<S-l>", "$", "silent")

nnoremap("<S-Right>", "<C-w><", "silent")
nnoremap("<S-Left>", "<C-w>>", "silent")
nnoremap("<S-Up>", "<C-w>+", "silent")
nnoremap("<S-Down>", "<C-w>-", "silent")

vnoremap("c", [["_c]], "silent")
vnoremap("p", [[_dp]], "silent")

nnoremap("<Esc><Esc>", "<cmd>noh<CR>", "silent")

nnoremap("<C-s>", [[:%s/]], "silent")

nnoremap("<leader>sp", "<cmd>PackerStatus<CR>")
nnoremap("<leader>sl", "<cmd>LuaCacheProfile<CR>")
