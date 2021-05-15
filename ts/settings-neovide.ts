import { set } from './utils';

const doNeovideSettings = () => {
  set('guifont', 'HackGenNerd');

  vim.g.neovide_cursor_vfx_mode = 'pixiedust';
};

export default doNeovideSettings;
