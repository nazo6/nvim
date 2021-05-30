import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'html',
  packageName: 'vscode-langservers-extracted',
  binName: 'vscode-html-language-server',
  args: ['--stdio']
});
