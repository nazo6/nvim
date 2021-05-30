import { ServerConfigType } from '../constants';
import { getServerDir } from '../utils';
import { npm } from '../installers/npm';

type configType = {
  serverName: string;
  packageName: string;
  binName?: string;
  args?: string[];
  defaultOptions?: any;
};

const win = vim.fn.has('win32') !== 0;

export const createNodeConfig = (config: configType) => {
  return {
    name: config.serverName,
    installer: () => npm(config.packageName, getServerDir(config.serverName)),
    defaultOptions: {
      cmd: [
        getServerDir(config.serverName) + '/node_modules/.bin/' + config.binName ??
          config.packageName + (win ? '.cmd' : ''),
        ...config.args
      ],
      ...config.defaultOptions
    }
  } as ServerConfigType;
};
