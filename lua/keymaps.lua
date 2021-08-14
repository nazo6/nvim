local map = require "utils.map"

map.nmap("k", "gk", map.ns)
map.nmap("gk", "k", map.ns)
map.nmap("j", "gj", map.ns)
map.nmap("gj", "j", map.ns)

map.tmap("<ESC>", "<C-\\><C-n>", map.n)
