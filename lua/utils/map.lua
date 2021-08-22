return {
  nmap = function(key, action, options)
    vim.api.nvim_set_keymap("n", key, action, options)
  end,
  imap = function(key, action, options)
    vim.api.nvim_set_keymap("i", key, action, options)
  end,
  tmap = function(key, action, options)
    vim.api.nvim_set_keymap("t", key, action, options)
  end,
  vmap = function(key, action, options)
    vim.api.nvim_set_keymap("", key, action, options)
  end,
  map = function(key, action, options)
    vim.api.nvim_set_keymap("", key, action, options)
  end,
  n = { noremap = true },
  ns = { noremap = true, silent = true },
  s = { silent = true },
  get_buf_map = function(bufnr, mode)
    return function(key, action, options)
      vim.api.nvim_buf_set_keymap(bufnr, mode, key, action, options)
    end
  end,
}
