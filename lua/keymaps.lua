local map = require "utils.map"

map.nmap("k", "gk", map.ns)
map.nmap("gk", "k", map.ns)
map.nmap("j", "gj", map.ns)
map.nmap("gj", "j", map.ns)

map.map("d", [["_d]], map.ns)
map.map("c", [["_c]], map.ns)

map.map("<leader>s", [[<CMD>%s/]], map.ns)

map.tmap("<ESC>", "<C-\\><C-n>", map.n)
