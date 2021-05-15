import { cmd, map } from '../utils';

require('lspsaga').init_lsp_saga();

map.nmap('K', ':Lspsaga hover_doc<CR>', map.ns);
map.nmap('<leader>a', ':Lspsaga code_action<CR>', map.ns);
map.nmap('<leader>rn', ':Lspsaga rename<CR>', map.ns);
map.nmap('gd', ':Lspsaga preview_definition<CR>', map.ns);
