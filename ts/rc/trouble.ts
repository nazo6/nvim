import { map } from '../utils/map';

map('trouble-toggle', '<leader>x', { mode: 'n', silent: true, noremap: true }, ':TroubleToggle<CR>');
