local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  highlight = { enable = true },
  indent = { enable = true },
}

require("treesitter-context").setup {
  max_lines = 2,
}
