import { createNodeConfig } from './common-node';

export const config = createNodeConfig({
  serverName: 'svelte',
  packageName: 'svelte-language-server',
  binName: 'svelteserver',
  args: ['--stdio']
});
