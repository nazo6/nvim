nnoremap <leader>s :source $MYVIMRC<CR>
" Space二回で単語ハイライト

nnoremap <silent> <leader>w :w<CR>

inoremap <silent> jj <ESC>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Plugins keymaps
nmap <silent><C-e> :CocCommand explorer<CR>

tnoremap <ESC>   <C-\><C-n>
nnoremap <silent><C-t>n :FloatermNew<CR>
tnoremap <silent><C-t>h <C-\><C-n>:FloatermHide<CR>
tnoremap <silent><C-t>x <C-\><C-n>:FloatermKill<CR>
nnoremap <silent><C-t>s :FloatermShow<CR>
nnoremap <silent><C-t>k :FloatermPrev<CR>
nnoremap <silent><C-t>j :FloatermNext<CR>
nnoremap <silent><C-t>k <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent><C-t>j <C-\><C-n>:FloatermNext<CR>

let g:vimspector_enable_mappings='HUMAN'

nnoremap <silent><C-p> :Clap files<CR>

nnoremap <silent> <Space><Space> :HopWord<CR>
