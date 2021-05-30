import { ServerNamesType, SERVERS } from './constants';

export const getServerDir = (serverName: string) => {
  return vim.fn.stdpath('data') + '/lsp/' + serverName;
};

export const createAndGetInstallDir = (serverName: ServerNamesType) => {};
