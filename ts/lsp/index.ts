import { ServerConfigType, ServerNamesType } from './constants';

export const installServer = (serverName: ServerNamesType) => {
  const serverconfig: ServerConfigType = require(`lsp.servers.${serverName}`);
  serverconfig.installer();
};

export const setupServer = (serverName: ServerNamesType, options: any) => {
  const serverconfig: ServerConfigType = require(`lsp.servers.${serverName}`);
  serverconfig.installer();
  (require('lspconfig')[serverName] as any as NoColonType).setup(
    vim.tbl_deep_extend('force', serverconfig.defaultOptions, options)
  );
};
