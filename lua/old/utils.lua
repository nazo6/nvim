local map = {}
function map.nmap(key, action,options)
  vim.api.nvim_set_keymap('n',key,action,options)
end

function map.imap(key, action,options)
  vim.api.nvim_set_keymap('i',key,action,options)
end

function map.tmap(key, action, options)
  vim.api.nvim_set_keymap('t',key,action,options)
end

return {
  map = map
}
