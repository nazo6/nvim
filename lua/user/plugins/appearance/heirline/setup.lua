require("heirline").setup {
  statusline = require "user.plugins.appearance.heirline.statusline",
  winbar = require "user.plugins.appearance.heirline.winbar",
  opts = {
    disable_winbar_cb = function(args)
      local buf = args.buf
      local buftype = vim.tbl_contains({ "prompt", "nofile", "help", "quickfix" }, vim.bo[buf].buftype)
      local filetype = vim.tbl_contains({ "gitcommit", "fugitive", "Trouble", "packer" }, vim.bo[buf].filetype)
      return buftype or filetype
    end,
  },
}
