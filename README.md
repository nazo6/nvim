# nvim

My neovim config.

## Concept

- Multi-platform support (Windows/Linux)
- Fast startup (About 40\~60ms on Linux and 120\~150ms on Windows)
  - Most of plugins are lazy-loaded
- Avoid external dependencies as much as possible

## Setup

```bash
cd ~/.config/nvim
git clone https://github.com/nazo6/nvim
nvim
```

```vim
:PackerSync
```

## Dependencies

### General

- C compiler (treesitter)

#### Windows

- win32yank (wsl clipboard)

#### Linux

- xclip (clipboard)

### TeX

- TeX Live (latexmk, latexindent)
- SumatraPDF

### Format

- deno

### SATySFi

- SATySFi

## Credits

- after/queries/satysfi/\* from
  [monaqa/tree-sitter-satysfi](https://github.com/monaqa/tree-sitter-satysfi/)
