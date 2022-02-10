# nvim

My neovim config.

## Concept
- Works on multi-platform (Windows/Linux)
- Fast startup (About 40~60ms on Linux and 120~150ms on Windows)
   - Most of plugins are lazy-loaded
   - Benchmark can be found [here](https://nazo6.github.io/nvim/)

## Setup
```bash
cd ~/.config/nvim
git clone https://github.com/nazo6/nvim
nvim
```

```vim
:PackerSync
:TSInstall maintained
:LspInstallInfo
:Install null_ls stylua
```
