# nvim

My neovim config.

## Concept
- Multi-platform support (Windows/Linux)
- Fast startup (About 40\~60ms on Linux and 120\~150ms on Windows)
   - Most of plugins are lazy-loaded
   - Benchmark can be found [here](https://nazo6.github.io/nvim/)
- Avoid external dependencies as much as possible

## Setup
```bash
cd ~/.config/nvim
git clone https://github.com/nazo6/nvim
nvim
```

## Dependencies
### General
- win32yank (for wsl clipboard)

### TeX
- TeX Live (latexmk, latexindent)
- SumatraPDF

```vim
:PackerSync
:TSInstall maintained
:LspInstallInfo
:Install null_ls stylua
```
