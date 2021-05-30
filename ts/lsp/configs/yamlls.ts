import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'yamlls',
  packageName: 'yaml-language-server',
  args: ['--stdio']
});
