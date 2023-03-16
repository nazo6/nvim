require("kanagawa").load "wave"
local utils = require "user.config.heirline.utils"

require("heirline").setup {
  statusline = utils.lrequire "statusline",
  winbar = utils.lrequire "winbar",
  opts = {
    disable_winbar_cb = function(args)
      local buf = args.buf
      local buftype = vim.tbl_contains({ "prompt", "nofile", "help", "quickfix" }, vim.bo[buf].buftype)
      local filetype = vim.tbl_contains({ "gitcommit", "fugitive", "Trouble", "packer" }, vim.bo[buf].filetype)
      return buftype or filetype
    end,
  },
}
