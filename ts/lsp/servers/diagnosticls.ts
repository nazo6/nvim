import { ServerConfigType } from '../constants';
import { npm } from '../installers/npm';
import { getServerDir } from '../utils';

const serverName = "diagnosticls"
export const config: ServerConfigType = {
  name: serverName,
  installer: () => npm("diagnostic-languageserver", getServerDir(serverName)),
  defaultOptions: {
    cmd: [getServerDir(serverName) + '/node_modules/.bin/diagnostic-languageserver', '--stdio']
  }
};
