import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'vimls',
  packageName: 'vim-language-server',
  args: ['--stdio']
});
