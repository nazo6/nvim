import * as lsp from '../lsp/index';
import { serverCfgs } from './lspconfigdata';
import { map } from '../utils';
import { autocmd } from '../utils/autocmd';

autocmd({
  id: 'StartServer',
  events: 'BufRead',
  filetypes: '*',
  command: ':LspStart'
});

autocmd({
  id: 'LspFormat',
  events: 'BufWritePre',
  filetypes: '*',
  command: () => {
    vim.lsp.buf.formatting_sync();
  }
});
map.nmap('<leader>f', ':lua vim.lsp.buf.formatting()<CR>', map.ns);

lsp.setup();

lsp.ensureInstallServers([
  'cssls',
  'html',
  'jsonls',
  'tsserver',
  'diagnosticls',
  'svelte',
  'vimls',
  'vuels',
  'yamlls',
  'bashls',
  'tailwindcss',
  'rust_analyzer'
]);

const manualServers = ['denols'];

const manualServersSetup = () => {
  const servers = manualServers;
  servers.forEach((serverName) => {
    const cfg: NoColonType = (serverCfgs as any)[serverName];
    (require('lspconfig')[serverName] as any as NoColonType).setup({
      ...cfg,
      on_attach: () => {
        require('lsp_signature').on_attach();
      }
    });
  });
};
const setup = () => {
  const servers = lsp.getInstalledServers();
  if (servers.includes('diagnosticls')) {
    servers.push(servers.splice(servers.indexOf('diagnosticls'), 1)[0]);
  }
  servers.forEach((serverName) => {
    const cfg: NoColonType = (serverCfgs as any)[serverName];
    lsp.setupServer(serverName, {
      ...cfg,
      on_attach: (client: any) => {
        require('lsp_signature').on_attach();
        cfg.on_attach ? cfg.on_attach(client) : '';
      }
    });
  });
};

manualServersSetup();
setup();
