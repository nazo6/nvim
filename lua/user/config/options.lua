local opt = vim.opt

-- Behavior
opt.shortmess:append "I"

opt.mouse = "a"
opt.mousemodel = "popup"
vim.cmd.aunmenu { "PopUp.How-to\\ disable\\ mouse" }
vim.cmd.aunmenu { "PopUp.-1-" }

opt.clipboard:append "unnamedplus"
if Args.feature.osc52 then
  local function paste()
    return {
      vim.split(vim.fn.getreg "", "\n"),
      vim.fn.getregtype "",
    }
  end

  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
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

vim.cmd [[autocmd BufWinEnter * if &filetype == 'help' | wincmd L | endif]]

-- I use nushell as shell and it sets env variable 'SHELL' to nushell.
-- This cause problems when command is invoked in nvim.
-- So, sets vim's shell to bash and only use nu in toggleterm
if vim.fn.has "unix" == 1 then
  opt.shell = "/bin/bash"
end

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
  virtual_text = true,
  virtual_lines = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
}

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

vim.api.nvim_create_user_command("LspLogClear", function()
  local log_path = vim.fs.joinpath(vim.fn.stdpath "state", "lsp.log")
  vim.fn.delete(log_path)
end, {})

vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    if vim.g.NVIM_RESTARTING then
      vim.g.NVIM_RESTARTING = false
      local session = require "possession.session"
      local ok = pcall(session.load, "restart")
      if ok then
        require("possession.session").delete("restart", { no_confirm = true })
        vim.opt.cmdheight = 1
      end
    end
  end,
})

if vim.fn.has "nvim-0.12" == 1 then
  vim.api.nvim_create_user_command("Restart", function()
    require("possession.session").save("restart", { no_confirm = true })
    vim.cmd [[silent! bufdo bwipeout]]

    vim.g.NVIM_RESTARTING = true

    vim.cmd [[restart]]
  end, {})
else
  vim.api.nvim_create_user_command("Restart", function()
    if vim.fn.has "gui_running" then
      vim.notify("GUI is not supported", vim.log.levels.WARN)
    end

    require("possession.session").save("restart", { no_confirm = true })
    vim.cmd [[silent! bufdo bwipeout]]

    vim.g.NVIM_RESTARTING = true

    vim.cmd [[qa!]]
  end, {})
end
