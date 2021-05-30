import { ServerConfigType, ServerNamesType, SERVERS } from './constants';
import { getServerDir } from './utils';

const getServerConfig = (name: ServerNamesType) => {
  return require(`lsp.configs.${name}`).config as any as ServerConfigType;
};
export const installServer = (serverName: ServerNamesType) => {
  getServerConfig(serverName).installer();
};

export const setupServer = (serverName: ServerNamesType, options?: any) => {
  const serverconfig = getServerConfig(serverName);
  (require('lspconfig')[serverName] as any as NoColonType).setup(
    vim.tbl_deep_extend('force', serverconfig.defaultOptions, options)
  );
};

export const getInstalledServers = () => {
  return SERVERS.filter((v) => vim.fn.isdirectory(getServerDir(v)) !== 0);
};

export const ensureInstallServers = (serverNames: ServerNamesType[]) => {
  const installed = getInstalledServers();
  serverNames.forEach((serverName) => {
    if (!installed.includes(serverName)) {
      installServer(serverName);
    }
  });
};
