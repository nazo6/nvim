import * as lsp from '../lsp/index';
import { serverCfgs } from './lspconfigdata';

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
