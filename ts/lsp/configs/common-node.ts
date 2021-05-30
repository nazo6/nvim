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
  const binName = config.binName ? config.binName : config.packageName;
  return {
    name: config.serverName,
    installer: (onExit: any) => npm(config.packageName, getServerDir(config.serverName), onExit),
    defaultOptions: {
      cmd: [
        getServerDir(config.serverName) + '/node_modules/.bin/' + binName + (win ? '.cmd' : ''),
        ...(config.args ?? [])
      ],
      ...(config.defaultOptions ?? {})
    }
  } as ServerConfigType;
};
