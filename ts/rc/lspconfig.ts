import { map } from '../utils';
import { autocmd } from '../utils/autocmd';

autocmd({
  id: 'LspFormat',
  events: 'BufWritePre',
  filetypes: '*',
  command: () => {
    vim.lsp.buf.formatting_sync();
  }
});
map.nmap('<leader>f', ':lua vim.lsp.buf.formatting()<CR>', map.ns);
