nnoremap("k", "gk", "silent")
nnoremap("gk", "k", "silent")
nnoremap("j", "gj", "silent")
nnoremap("gj", "j", "silent")

vnoremap("c", [["_c]], "silent")
vnoremap("p", [[_dp]], "silent")

noremap("<leader>s", [[:%s/]], "silent")

tnoremap("<ESC>", "<C-\\><C-n>")

nnoremap("<C-p>", "<cmd>Telescope neoclip<CR>", "silent")
nnoremap("<leader>p", "<cmd>Telescope live_grep<CR>", "silent")

nnoremap("<leader>x", ":TroubleToggle<CR>", { noremap = true, silent = true })

nmap("<leader>S", ":lua require('spectre').open()<CR>", { noremap = true, silent = true })

nnoremap("<C-e>", "<cmd>NvimTreeToggle<CR>", "silent")

tnoremap("<ESC>", "<C-\\><C-n>")
nnoremap("<C-t>n", ":FloatermNew --wintype=split --height=0.3<CR>", "silent")
tnoremap("<C-t>h", "<C-\\><C-n>:FloatermHide<CR>", "silent")
tnoremap("<C-t>x", "<C-\\><C-n>:FloatermKill<CR>", "silent")
nnoremap("<C-t>s", ":FloatermShow<CR>", "silent")
nnoremap("<C-t>k", ":FloatermPrev<CR>", "silent")
nnoremap("<C-t>j", ":FloatermNext<CR>", "silent")
nnoremap("<C-t>k", "<C-\\><C-n>:FloatermPrev<CR>", "silent")
tnoremap("<C-t>j", "<C-\\><C-n>:FloatermNext<CR>", "silent")
nnoremap("<leader>g", ":FloatermNew --width=0.8 --height=0.9 gitui<CR>", "silent")
