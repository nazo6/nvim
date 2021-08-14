local map = require "utils.map"

require("trouble").setup {}

map.nmap("<leader>x", ":TroubleToggle<CR>", { noremap = true, silent = true })
