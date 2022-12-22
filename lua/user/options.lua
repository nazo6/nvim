local opt = vim.opt

-- Behavior
opt.shortmess:append "I"

opt.mouse = "a"
opt.mousemodel = "extend"

if vim.fn.has "wsl" == 1 then
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
opt.autoread = true

opt.smartcase = true
opt.ignorecase = true
opt.inccommand = "split"

opt.foldlevel = 99
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

opt.updatetime = 300

vim.cmd [[autocmd FileType help wincmd L]]

-- Key
opt.timeoutlen = 400

-- Editing
opt.completeopt = "menuone,noselect"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Appearance
if vim.fn.has "termguicolors" == 1 then
  opt.termguicolors = true
end

opt.number = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.sidescrolloff = 16
opt.list = true

opt.winblend = 15
opt.pumblend = 15

vim.diagnostic.config {
  virtual_lines = false,
}
