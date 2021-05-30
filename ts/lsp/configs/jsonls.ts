import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'cssls',
  packageName: 'vscode-langservers-extracted',
  binName: 'vscode-json-language-server',
  args: ['--stdio']
});
