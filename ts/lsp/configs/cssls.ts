import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'cssls',
  packageName: 'vscode-langservers-extracted',
  binName: 'vscode-css-language-server',
  args: ['--stdio']
});
