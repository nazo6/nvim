import { map } from '../utils';
import { map as luamap } from '../utils/map';

vim.g.coc_global_extensions = [
  'coc-json',
  'coc-tsserver',
  'coc-html',
  'coc-css',
  'coc-eslint',
  'coc-prettier',
  'coc-deno',
  'coc-flutter',
  'coc-rust-analyzer',
  'coc-lua',
  'coc-yaml',
  'coc-explorer'
];

luamap('hover', 'K', { mode: 'n', noremap: true, silent: true }, () => {
  if (vim.fn.index(['vim', 'help'], vim.bo.filetype)) {
    vim.fn.CocAction('doHover');
  }
});

map.nmap('<leader>rn', '<Plug>(coc-rename)', map.s);
map.nmap('<leader>ac', '<Plug>(coc-codeaction)', map.s);

map.imap('<Tab>', 'pumvisible() ? coc#_select_confirm() : "<C-g>u<Tab>"', { noremap: true, silent: true, expr: true });
