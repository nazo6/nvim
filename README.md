# nvim

My neovim config.

## Setup

```bash
cd ~/.config/nvim
git clone https://github.com/nazo6/nvim
nvim
```

## Profiling

1. `git clone https://github.com/stevearc/profile.nvim` to config root
2.
   - To just enable profile `$env:NVIM_PROFILE=1 nvim`(powershell)
     or`NVIM_PROFILE=1 nvim` to start nvim.
   - Or to enable startup config profile execute
     `$env:NVIM_PROFILE=start nvim`(powershell) or`NVIM_PROFILE=start nvim`.
3. `<F1>` to toggle profile.

## Dependencies

### General

- C compiler (treesitter)

#### Windows

- win32yank (wsl clipboard)

#### Linux
