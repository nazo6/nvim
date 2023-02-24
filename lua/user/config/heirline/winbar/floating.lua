return {
  {},
  condition = function()
    return vim.api.nvim_win_get_config(0).relative ~= ""
  end,
}
