local map = require "utils.map"

require("telescope").setup()

require("telescope").load_extension "neoclip"

map.nmap("<C-p>", "<cmd>Telescope neoclip<CR>", map.ns)
map.nmap("<leader>p", "<cmd>Telescope live_grep<CR>", map.ns)
