import setKeymaps from './keymaps';
import doSettings from './settings';
import loadPlugins from './plugins';

vim.g.mapleader = ' ';

loadPlugins();
setKeymaps();
doSettings();

require('rc.lsp');
