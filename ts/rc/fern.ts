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
  id: 'fern-keymaps',
  events: 'FileType',
  filetypes: 'fern',
  command: () => {
    vim.api.nvim_buf_set_keymap(0, 'n', '<Plug>(fern-action-open)', '<Plug>(fern-action-open:select)', {});
    vim.api.nvim_buf_set_keymap(0, 'n', 'd', '<Plug>(fern-action-remove)', {});
  }
});
autocmd({
  id: 'fern-glyph',
  events: 'FileType',
  filetypes: 'fern',
  command: 'call glyph_palette#apply()'
});
