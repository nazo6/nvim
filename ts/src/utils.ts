export const utils = {
  setOption: function (key: string, value: string) {
    vim.api.nvim_set_option(key, value);
  },
  getOption: function (key: string) {
    return vim.api.nvim_get_option(key);
  },
};

export const map = {
  nmap: function (key: string, action: string, options: any) {
    vim.api.nvim_set_keymap("n", key, action, options);
  },
  imap: function (key: string, action: string, options: any) {
    vim.api.nvim_set_keymap("i", key, action, options);
  },
  tmap: function (key: string, action: string, options: any) {
    vim.api.nvim_set_keymap("t", key, action, options);
  },
};
