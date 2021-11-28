nnoremap("k", "gk", "silent")
nnoremap("gk", "k", "silent")
nnoremap("j", "gj", "silent")
nnoremap("gj", "j", "silent")

nmap("<S-Right>", "<C-w><", "silent")
nmap("<S-Left>", "<C-w>>", "silent")
nmap("<S-Up>", "<C-w>+", "silent")
nmap("<S-Down>", "<C-w>-", "silent")

vnoremap("c", [["_c]], "silent")
vnoremap("p", [[_dp]], "silent")

noremap("<leader>s", [[:%s/]], "silent")

nnoremap("<leader>g", "<cmd>Neogit<CR>", "silent")
