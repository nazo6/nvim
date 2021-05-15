import { cmd } from "../utils";

type PackerUseOptionsType = {
  disable?: boolean;
  as?: string;
  installer?: () => void;
  updater?: () => void;
  after?: string | string[];
  rtp?: string;
  opt?: boolean;
  branch?: string;
  tag?: string;
  commit?: string;
  lock?: boolean;
  run?: string | (() => void);
  requires?: string | string[];
  rocks?: string | string[];
  config?: string | (() => void);
  setup?: string | (() => void);
  cmd?: string | string[];
  ft?: string | string[];
  keys?: string | string[];
  event?: string | string[];
  fn?: string | string[];
  cond?: string | (() => void) | string[] | (() => void);
  module?: string | string[];
};

const install_path =
  vim.fn.stdpath("data") + "/site/pack/packer/start/packer.nvim/";
if (vim.fn.isdirectory(install_path) !== 1) {
  vim.fn.mkdir(install_path, "p");
  cmd("!git clone https://github.com/wbthomason/packer.nvim " + install_path);
}
cmd("packadd packer.nvim");

const packerLua = require("packer");
const packer = {
  startup: (func: () => void) => {
    packerLua.startup(func);
  },
  init: (options: any) => {
    packerLua.init(options)
  },
  reset: () => { packerLua.reset() },
  use: (pluginName: string, options?: PackerUseOptionsType) => {
    if (!options) {
      packerLua.use(pluginName);
    } else {
      packerLua.use({ 1: pluginName, ...options });
    }
  },
};
export default packer;
