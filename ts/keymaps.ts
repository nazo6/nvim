import { map } from './utils';

const setKeymaps = () => {
  map.nmap('<leader>s', ':Reload<CR>', map.n);

  map.imap('jj', '<ESC>', map.ns);

  map.nmap('k', 'gk', map.ns);
  map.nmap('gk', 'k', map.ns);
  map.nmap('j', 'gj', map.ns);
  map.nmap('gj', 'j', map.ns);

  map.nmap('<Space><Space>', ':HopWord<CR>', map.ns);

  map.nmap('<C-p>', ':Telescope find_files<CR>', map.ns);
  map.nmap('<leader>p', ':Telescope live_grep<CR>', map.ns);
  map.nmap('<C-e>', ':NvimTreeToggle<CR>', map.ns);

  map.tmap('<ESC>', `<C-\\><C-n>`, map.n);
  map.nmap('<C-t>n', ':FloatermNew<CR>', map.ns);
  map.tmap('<C-t>h', `<C-\\><C-n>:FloatermHide<CR>`, map.ns);
  map.tmap('<C-t>x', `<C-\\><C-n>:FloatermKill<CR>`, map.ns);
  map.nmap('<C-t>s', ':FloatermShow<CR>', map.ns);
  map.nmap('<C-t>k', ':FloatermPrev<CR>', map.ns);
  map.nmap('<C-t>j', ':FloatermNext<CR>', map.ns);
  map.nmap('<C-t>k', `<C-\\><C-n>:FloatermPrev<CR>`, map.ns);
  map.tmap('<C-t>j', `<C-\\><C-n>:FloatermNext<CR>`, map.ns);

  map.nmap('<leader>g', ':FloatermNew --width=0.8 --height=0.9 gitui<CR>', map.ns);
};
export default setKeymaps;
