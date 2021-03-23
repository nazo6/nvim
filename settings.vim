set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus

if exists('g:vscode')
else
  set number
  

  au ucmd VimEnter * nested colorscheme codedark

  if has("win32")
    set shell=pwsh
    set shellcmdflag=-c
    set shellquote=\"
    set shellxquote=
  endif
endif