local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "go",
    "rust",
    "python",
    "toml",
    "yaml",
    "regex",
    "lua",
    "json",
    "jsonc",
    "tsx",
    "css",
    "html",
    "comment",
    "c",
    "cpp",
    "dart",
    "jsdoc",
    "http",
  },
  highlight = { enable = true },
  indent = { enable = true },
}

require("treesitter-context").setup {
  max_lines = 2,
}
