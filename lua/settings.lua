local opt = vim.opt

vim.g.mapleader = " "

--- Behavior
opt.shortmess:append "I"

opt.mouse = "a"
if vim.fn.has "wsl" then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
opt.clipboard:append "unnamedplus"

opt.undofile = true

opt.confirm = true

opt.smartcase = true
opt.ignorecase = true
opt.inccommand = "split"

opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd [[autocmd FileType help wincmd L]]

--- Key
opt.timeoutlen = 400

--- Editing

opt.completeopt = "menuone,noselect"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

--- Appearance
opt.number = true
opt.signcolumn = "number"
opt.cursorline = true
opt.scrolloff = 5

opt.winblend = 15
opt.pumblend = 15
