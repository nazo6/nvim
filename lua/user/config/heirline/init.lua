local utils = require "user.config.heirline.utils"

require("heirline").setup {
  statusline = utils.require "statusline",
  winbar = utils.require "winbar",
}
