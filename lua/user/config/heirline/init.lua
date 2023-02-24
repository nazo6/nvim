local utils = require "user.config.heirline.utils"

require("heirline").setup {
  statusline = utils.lrequire "statusline",
  winbar = utils.lrequire "winbar",
}
