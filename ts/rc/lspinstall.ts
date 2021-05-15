import { cmd } from '../utils';
import { serverCfgs } from './lspconfigdata';

const setup_servers = () => {
  require('lspinstall').setup();
  const servers: any[] = require('lspinstall').installed_servers();
  if (servers.includes('diagnosticls')) {
    servers.push(servers.splice(servers.indexOf('diagnosticls'), 1)[0]);
  }
  for (const server of servers) {
    const cfg: NoColonType = serverCfgs[server];
    (require('lspconfig')[server] as any as NoColonType).setup({
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
  }
};

setup_servers();

require('lspinstall').post_install_hook = () => {
  setup_servers();
  cmd('bufdo e');
};
