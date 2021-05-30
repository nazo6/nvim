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

lsp.ensureInstallServers(['tsserver', 'diagnosticls']);

const setup = () => {
  const servers = lsp.getInstalledServers();
  if (servers.includes('diagnosticls')) {
    servers.push(servers.splice(servers.indexOf('diagnosticls'), 1)[0]);
  }
  servers.forEach((serverName) => {
    const cfg: NoColonType = serverCfgs[serverName];
    lsp.setupServer(serverName, {
      ...cfg,
      on_attach: (client: any) => {
        require('lsp_signature').on_attach({
          bind: true,
          doc_lines: 10,
          hint_enable: true,
          hint_scheme: 'String',
          handler_opts: {
            border: 'shadow'
          },
          decorator: ['`', '`']
        });
        if (cfg.on_attach) {
          cfg.on_attach(client);
        }
      }
    });
  });
};

setup();
