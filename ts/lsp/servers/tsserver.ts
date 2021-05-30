import { ServerConfigType } from '../constants';
import { getServerDir } from '../utils';

export const config: ServerConfigType = {
  name: 'tsserver',
  installer: () => {},
  defaultOptions: {
    cmd: [getServerDir('tsserver') + '/node_modules/.bin/typescript-language-server', '--stdio']
  }
};
