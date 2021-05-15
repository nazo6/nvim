import doNeovideSettings from './settings-neovide';
import { cmd, set } from './utils';
import { autocmd } from './utils/autocmd';

const doSettings = () => {
  //System settings
  set('autoread', true);

  set('mouse', 'a');
  autocmd({
    id: 'clipboard',
    events: ['BufNewFile', 'BufRead'],
    filetypes: '*',
    command: 'set clipboard+=unnamed'
  });

  const undodir = vim.fn.stdpath('data') + '/undo';
  if (vim.fn.isdirectory(undodir) !== 1) {
    vim.fn.mkdir(undodir, 'p');
  }
  set('undodir', undodir);
  set('undofile', true);

  set('smartcase', true);
  set('ignorecase', true);

  set('completeopt', 'menuone,noselect');

  //Format settings
  set('tabstop', 2);
  set('shiftwidth', 2);
  set('expandtab', true);

  //Appearance settings
  cmd('set number');
  cmd('set signcolumn=number');
  cmd('syntax on');
  cmd('set cursorline');

  set('winblend', 15);
  set('pumblend', 15);
  cmd('hi NormalFloat guifg=#2e3440 guibg=#a3be8c');
  cmd('hi Pmenu guifg=#2e3440 guibg=#a3be8c');

  vim.g.tokyonight_style = 'night';
  vim.g.tokyonight_sidebars = ['coc-explorer'];
  cmd('colorscheme tokyonight');
  if (vim.fn.has('termguicolors') === 1) {
    set('termguicolors', true);
  }

  //Windows settings
  if (vim.fn.has('win32') == 1) {
    set('shell', 'pwsh');
    set('shellcmdflag', '-c');
    set('shellquote', '\\"');
    set('shellxquote', '');
  }

  if (vim.fn.exists('g:started_by_firenvim') == 1) {
    cmd('echo g:started_by_firenvim');
    set('guifont', 'HackGenNerd:h9');
  }

  if (vim.fn.exists('g:neovide')) {
    doNeovideSettings();
  }
};

export default doSettings;
