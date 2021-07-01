import { map } from '../utils/map';
const npairs = require('nvim-autopairs');
npairs.setup();

/*map('autopairs-newline', '<CR>', { mode: 'i', noremap: true, silent: true }, () => {
  if (vim.fn.pumvisible() !== 0) {
    return npairs.esc('<cr>');
  } else {
    return npairs.autopairs_cr();
  }
});*/
require('nvim-autopairs.completion.compe').setup({
  map_cr: true,
  map_complete: true
});
