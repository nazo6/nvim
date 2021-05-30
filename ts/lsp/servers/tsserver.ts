import { ServerConfigType } from '../constants';
import { getServerDir } from '../utils';
import { npm } from '../installers/npm';

const serverName = "tsserver"
export const config: ServerConfigType = {
  name: serverName,
  installer: () => npm("typescript-language-server", getServerDir(serverName)),
  defaultOptions: {
    cmd: [getServerDir(serverName) + '/node_modules/.bin/diagnostic-language-server', '--stdio']
  }
}
