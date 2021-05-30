import setKeymaps from './keymaps';
import doSettings from './settings';
import loadPlugins from './plugins';

vim.g.mapleader = ' ';
vim.lsp.set_log_level('debug');

loadPlugins();
setKeymaps();
doSettings();

require('rc.lsp');
