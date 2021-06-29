import { autocmd } from '../utils/autocmd';
vim.g['fern#renderer'] = 'nerdfont';

autocmd({
  id: 'fern-hide',
  events: 'FileType',
  filetypes: 'fern',
  command: () => {
    vim.cmd('set nonumber');
  }
});
autocmd({
  id: 'fern-glyph',
  events: 'FileType',
  filetypes: 'fern',
  command: 'call glyph_palette#apply()'
});
