import { utils } from "./utils";

const loadDein = () => {
  const dein_dir = vim.fn.expand("~/.cache/dein");
  const dein_repo_dir = dein_dir + "/repos/github.com/Shougo/dein.vim";

  utils.setOption(
    "runtimepath",
    `${dein_repo_dir},${utils.getOption("runtimepath")}`
  );

  if (vim.fn["dein#load_state"](dein_dir) == 1) {
    vim.fn["dein#begin"](dein_dir);
    const rc_dir = vim.fn.expand("~/.config/nvim");
    const toml = rc_dir + "/dein.toml";
    vim.fn["dein#load_toml"](toml);
    vim.fn["dein#end"]();
    vim.fn["dein#save_statel"];
  }

  if (vim.fn["dein#check_install"]() != 0) {
    vim.fn["dein#install"]();
  }

  const removed_plugins = vim.fn["dein#check_clean"]();
  if (vim.fn.len(removed_plugins) > 0) {
    vim.fn.map(removed_plugins, "delete(v:val, 'rf')");
    vim.fn["dein#recache_runtimepath"]();
  }
};

export default loadDein;
