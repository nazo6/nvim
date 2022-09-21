vim.cmd[[packadd nvim-ts-autotag]]
vim.cmd[[packadd nvim-treesitter-textobjects]]

local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  auto_install = true,
  highlight = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  indent = {
    enable = true,
  },
  autotag = { enable = true },
}

require("treesitter-context").setup {
  enable = true,
  throttle = true,
  max_lines = 3,
}
