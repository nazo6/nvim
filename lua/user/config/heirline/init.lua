require("kanagawa").load "wave"
local utils = require "user.config.heirline.utils"

require("heirline").setup {
  statusline = utils.lrequire "statusline",
  winbar = utils.lrequire "winbar",
}

vim.api.nvim_del_augroup_by_name "Heirline_init_winbar"
vim.o.winbar = "%{%v:lua.require'heirline'.eval_winbar()%}"
