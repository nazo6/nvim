return {
  nmap = function(key, action, options)
    vim.api.nvim_set_keymap('n', key, action, options)
  end,
  imap = function(key, action, options)
    vim.api.nvim_set_keymap('i', key, action, options)
  end,
  tmap = function(key, action, options)
    vim.api.nvim_set_keymap('t', key, action, options)
  end,
  n = { noremap = true },
  ns = { noremap = true, silent = true },
  s = { silent = true },
}
