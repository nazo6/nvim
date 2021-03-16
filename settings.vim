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

au ucmd VimEnter * nested colorscheme codedark
