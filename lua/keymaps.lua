local map = require "utils.map"

map.nmap("k", "gk", map.ns)
map.nmap("gk", "k", map.ns)
map.nmap("j", "gj", map.ns)
map.nmap("gj", "j", map.ns)

map.vmap("c", [["_c]], map.ns)
map.vmap("p", [[_dp]], map.ns)

map.map("<leader>s", [[:%s/]], map.ns)

map.tmap("<ESC>", "<C-\\><C-n>", map.n)
