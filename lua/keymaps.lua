local map = require "utils.map"

map.nmap("k", "gk", map.ns)
map.nmap("gk", "k", map.ns)
map.nmap("j", "gj", map.ns)
map.nmap("gj", "j", map.ns)

map.vmap("c", [["_c]], map.ns)
map.vmap("p", [[_dp]], map.ns)

map.map("<leader>s", [[:%s/]], map.ns)

map.tmap("<ESC>", "<C-\\><C-n>", map.n)

map.nmap("<C-p>", "<cmd>Telescope neoclip<CR>", map.ns)
map.nmap("<leader>p", "<cmd>Telescope live_grep<CR>", map.ns)

map.nmap("<leader>x", ":TroubleToggle<CR>", { noremap = true, silent = true })

map.nmap("<leader>S", ":lua require('spectre').open()<CR>", { noremap = true, silent = true })

map.nmap("<C-e>", "<cmd>NvimTreeToggle<CR>", map.ns)

map.tmap("<ESC>", "<C-\\><C-n>", map.n)
map.nmap("<C-t>n", ":FloatermNew --wintype=split --height=0.3<CR>", map.ns)
map.tmap("<C-t>h", "<C-\\><C-n>:FloatermHide<CR>", map.ns)
map.tmap("<C-t>x", "<C-\\><C-n>:FloatermKill<CR>", map.ns)
map.nmap("<C-t>s", ":FloatermShow<CR>", map.ns)
map.nmap("<C-t>k", ":FloatermPrev<CR>", map.ns)
map.nmap("<C-t>j", ":FloatermNext<CR>", map.ns)
map.nmap("<C-t>k", "<C-\\><C-n>:FloatermPrev<CR>", map.ns)
map.tmap("<C-t>j", "<C-\\><C-n>:FloatermNext<CR>", map.ns)
map.nmap("<leader>g", ":FloatermNew --width=0.8 --height=0.9 gitui<CR>", map.ns)
