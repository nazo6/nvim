local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  highlight = { enable = true },
}

require("treesitter-context").setup {
  enable = true,
  throttle = true,
  max_lines = 3,
}
