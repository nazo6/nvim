local map = require "utils.map"

require("telescope").setup()

map.nmap("<C-p>", "<cmd>Telescope find_files<CR>", map.ns)
map.nmap("<leader>p", "<cmd>Telescope live_grep<CR>", map.ns)
