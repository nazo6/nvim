nnoremap <leader>s :source $MYVIMRC<CR>
" Space二回で単語ハイライト
nnoremap <silent> <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>

nnoremap <silent> <leader>w :w<CR>

inoremap <silent> jj <ESC>

" Plugins keymaps
nmap <silent><C-e> :Fern . -drawer -toggle<CR>

nnoremap <silent><C-t> :<C-u>Deol -split=floating<CR>
tnoremap <ESC>   <C-\><C-n>

let g:vimspector_enable_mappings='HUMAN'

nnoremap <silent><C-p> :Clap files<CR>
