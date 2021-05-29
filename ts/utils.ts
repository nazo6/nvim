export const set = vim.api.nvim_set_option;
export const get = vim.api.nvim_get_option;
export const cmd = vim.cmd;
export const api = vim.api;

export const utils = {
  setOption: function (key: string, value: string) {
    set(key, value);
  },
  getOption: function (key: string) {
    return get(key);
  },
  vimCmds: function (cmds: string) {
    cmds.split('\n').forEach((line) => {
      if (line) {
        cmd(line);
      }
    });
  }
};

export const map = {
  nmap: function (key: string, action: string, options: any) {
    vim.api.nvim_set_keymap('n', key, action, options);
  },
  imap: function (key: string, action: string, options: any) {
    vim.api.nvim_set_keymap('i', key, action, options);
  },
  tmap: function (key: string, action: string, options: any) {
    vim.api.nvim_set_keymap('t', key, action, options);
  },
  n: { noremap: true },
  ns: { noremap: true, silent: true },
  s: { silent: true }
};
