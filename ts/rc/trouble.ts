import { map } from '../utils';

require('trouble').setup({});

map.nmap('<leader>x', '<cmd>TroubleToggle<CR>', map.ns);
