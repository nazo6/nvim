import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'bashls',
  packageName: 'bash-language-server',
  args: ['start']
});
