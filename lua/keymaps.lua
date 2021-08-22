local map = require "utils.map"

map.nmap("k", "gk", map.ns)
map.nmap("gk", "k", map.ns)
map.nmap("j", "gj", map.ns)
map.nmap("gj", "j", map.ns)

map.map("p", [["0p]], map.ns)
map.map("P", [["0P]], map.ns)

map.map("<leader>s", [[<CMD>%s/]], map.ns)

map.tmap("<ESC>", "<C-\\><C-n>", map.n)
