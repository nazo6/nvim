import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'tsserver',
  packageName: 'typescript-language-server',
  args: ['--stdio']
});
