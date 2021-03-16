inoremap <silent> jj <ESC>

" Plugins keymaps
nmap <silent><C-e> :Fern . -drawer -toggle<CR>

nnoremap <silent><C-t> :<C-u>Deol -split=floating<CR>
tnoremap <ESC>   <C-\><C-n>

let g:vimspector_enable_mappings='HUMAN'
