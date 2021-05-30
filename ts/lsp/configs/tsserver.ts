import { ServerConfigType } from '../constants';
import { getServerDir } from '../utils';
import { npm } from '../installers/npm';
import {createNodeConfig} from "./common-node"

export const config = createNodeConfig({
  serverName: "tsserver",
  packageName: "typescript-language-server",
  args: ["--stdio"]
})
