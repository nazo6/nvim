export const utils = {
  setOption: function (this: void, key: string, value: string) {
    vim.api.nvim_set_option(key, value);
  },
  getOption: function (this: void, key: string) {
    return vim.api.nvim_get_option(key);
  },
};
