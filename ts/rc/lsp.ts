import * as lsp from '../lsp/index';
import { serverCfgs } from './lspconfigdata';
import { map } from '../utils';
import { autocmd } from '../utils/autocmd';

autocmd({
  id: 'LspFormat',
  events: 'BufWritePre',
  filetypes: '*',
  command: () => {
    vim.lsp.buf.formatting_sync();
  }
});
map.nmap('<leader>f', ':lua vim.lsp.buf.formatting()<CR>', map.ns);

lsp.ensureInstallServers([
  "tsserver", "diagnosticls"
]);

const setup = () => {
  const servers = lsp.getInstalledServers();
  if (servers.includes('diagnosticls')) {
    servers.push(servers.splice(servers.indexOf('diagnosticls'), 1)[0]);
  }
  servers.forEach((serverName) => {
    lsp.setupServer(serverName, serverCfgs[serverName] ?? {});
  });
};

setup();

