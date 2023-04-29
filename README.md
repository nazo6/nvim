# nvim

My neovim config.

## Concept

- Multi-platform support (Windows/Linux)
- Fast startup (About 25ms on Linux and 70ms on Windows)
  - Most of plugins are lazy-loaded
- Avoid external dependencies as much as possible

## Setup

```bash
cd ~/.config/nvim
git clone https://github.com/nazo6/nvim
nvim
```

## Profiling

We can profile lua thanks to
[https://github.com/stevearc/profile.nvim](https://github.com/stevearc/profile.nvim)

1. `git clone https://github.com/stevearc/profile.nvim` to config root
2.
   - To just enable profile `$env:NVIM_PROFILE=1 nvim`(powershell)
     or`NVIM_PROFILE=1 nvim` to start nvim.
   - Or to enable startup config profile execute
     `$env:NVIM_PROFILE=start nvim`(powershell) or`NVIM_PROFILE=start nvim`.
3. `<F1>` to toggle profile.

NOTE: Enabling profile causes significant performance decrease. Usually, don't
use it.

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

- after/queries/nu/\* from
  [monaqa/tree-sitter-satysfi](https://github.com/monaqa/tree-sitter-satysfi/)
