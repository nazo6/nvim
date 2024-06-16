local opt = vim.opt

-- Behavior
opt.shortmess:append "I"

opt.mouse = "a"
opt.mousemodel = "popup"
vim.cmd.aunmenu { "PopUp.How-to\\ disable\\ mouse" }
vim.cmd.aunmenu { "PopUp.-1-" }

opt.clipboard:append "unnamedplus"
if Args.feature.osc52 then
  local empty_provider = function() end
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = empty_provider,
      ["*"] = empty_provider,
    },
  }
else
  if vim.fn.has "win32" == 1 then
    vim.g.clipboard = {
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
    }
  end
end

opt.undofile = true

opt.confirm = true
opt.autoread = true
opt.fileformat = "unix"
opt.fileformats = "unix,dos"

opt.smartcase = true
opt.ignorecase = true
opt.inccommand = "split"

opt.numberwidth = 3

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = ">",
}

opt.updatetime = 300

opt.exrc = true

vim.cmd [[autocmd FileType help wincmd L]]

-- Key
opt.timeoutlen = 400

-- Editing
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Appearance
if vim.fn.has "termguicolors" == 1 then
  opt.termguicolors = true
end

opt.laststatus = 3

opt.title = true
local wsl_prefix = vim.fn.has "wsl" == 1 and " [wsl]" or ""
opt.titlestring = "%{getcwd()}" .. " - NVIM" .. wsl_prefix

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

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })

-- Prevent closing terminal in insert mode if exited
vim.api.nvim_create_autocmd("TermClose", {
  callback = function(ctx)
    vim.cmd "stopinsert"
    vim.api.nvim_create_autocmd("TermEnter", {
      callback = function()
        vim.cmd "stopinsert"
      end,
      buffer = ctx.buf,
    })
  end,
  nested = true,
})

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}
