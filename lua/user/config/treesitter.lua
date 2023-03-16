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
parser_config.just = {
  install_info = {
    url = "https://github.com/IndianBoy42/tree-sitter-just",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
  },
  maintainers = { "@IndianBoy42" },
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
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
}

require("treesitter-context").setup {
  enable = true,
  throttle = true,
  max_lines = 3,
}
