import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'diagnosticls',
  packageName: 'diagnostic-languageserver',
  args: ['--stdio']
});
