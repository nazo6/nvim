import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'yamls',
  packageName: 'yaml-language-server',
  args: ['--stdio']
});