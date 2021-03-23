if exists('g:vscode')
  let s:dein_path = '~/.cache/dein-vscode'
  set runtimepath+=~/.cache/dein-vscode/repos/github.com/Shougo/dein.vim
else
  let s:dein_path = '~/.cache/dein'
  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
endif

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)
  
  let s:toml_common = '~/.config/nvim/plugins-common.toml'
  let s:toml_native = '~/.config/nvim/plugins-native.toml'

  call dein#load_toml(s:toml_common, {})
  if exists('g:vscode')
    call dein#load_toml('~/.config/nvim/plugins-vscode.toml', {})
  else
    call dein#load_toml(s:toml_native, {})
  endif
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" End dein -------------------
