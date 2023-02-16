local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.satysfi = {
  install_info = {
    url = "https://github.com/monaqa/tree-sitter-satysfi",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "satysfi",
}
parser_config.nu = {
  install_info = {
    url = "https://github.com/LhKipp/tree-sitter-nu",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
  },
  filetype = "nushell",
}

local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  auto_install = false,
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
