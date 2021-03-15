" Dein.vim ----------------
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let mapleader = "\<Space>"
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml_dir = $HOME . '/.config/nvim'
  let s:toml = s:toml_dir . '/dein.toml'

  call dein#load_toml(s:toml, {})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" End dein -------------------

set number
set tabstop=2
set shiftwidth=2
set expandtab
if has("win32")
  set shell=pwsh
  set shellcmdflag=-c
  set shellquote=\"
  set shellxquote=
endif
augroup MyVimrc
    autocmd!
augroup END

autocmd MyVimrc BufNewFile,BufRead dein*.toml call s:syntax_range_dein()

function! s:syntax_range_dein() abort
  let start = '^\s*hook_\%('.
  \           'add\|source\|post_source\|post_update'.
  \           '\)\s*=\s*%s'

  call SyntaxRange#Include(printf(start, "'''"), "'''", 'vim', '')
  call SyntaxRange#Include(printf(start, '"""'), '"""', 'vim', '')
endfunction

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
