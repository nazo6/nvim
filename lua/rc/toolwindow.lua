local map = require 'utils.map'
map.nmap('<leader>x', ':lua require("toolwindow").open_window("trouble", nil)<CR>', map.ns)
