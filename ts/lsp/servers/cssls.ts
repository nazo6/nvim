import { ServerConfigType } from '../constants';
import { npm } from '../installers/npm';
import { getServerDir } from '../utils';

const name = 'diagnosticls';
export const config: ServerConfigType = {
  name,
  installer: () => npm('diagnostic-languageserver', getServerDir(name)),
  defaultOptions: {
    cmd: [getServerDir(name) + '/node_modules/.bin/diagnostic-languageserver', '--stdio']
  }
};
