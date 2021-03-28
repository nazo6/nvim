local m = require('utils').map

local n = {noremap = true}
local ns = {noremap = true, silent = true}

m.nmap('<leader>s', ':source $MYVIMRC<CR>',n)

m.imap('jj', '<ESC>',ns)

m.nmap('k','gk',n)
m.nmap('gk','k',n)
m.nmap('j','gj',n)
m.nmap('gj','j',n)

m.nmap('<C-e>',':CocCommand explorer<CR>',ns)

m.tmap('<ESC>',[[<C-\><C-n>]],n)
m.nmap('<C-t>n', ':FloatermNew<CR>',ns)
m.tmap('<C-t>h', [[<C-\><C-n>:FloatermHide<CR>]],ns)
m.tmap('<C-t>x', [[<C-\><C-n>:FloatermKill<CR>]],ns)
m.nmap('<C-t>s', ':FloatermShow<CR>',ns)
m.nmap('<C-t>k', ':FloatermPrev<CR>',ns)
m.nmap('<C-t>j', ':FloatermNext<CR>',ns)
m.nmap('<C-t>k', [[<C-\><C-n>:FloatermPrev<CR>]],ns)
m.tmap('<C-t>j', [[<C-\><C-n>:FloatermNext<CR>]],ns)

vim.g.vimspector_enable_mappings='HUMAN'

m.nmap('<C-p>' ,':Clap files<CR>',ns)

m.nmap(' <Space><Space>', ':HopWord<CR>',ns)
