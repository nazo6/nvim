return {
  "RRethy/vim-illuminate",
  event = { "BufRead", "InsertEnter" },
  config = function()
    require("illuminate").configure {
      delay = 500,
      providers = {
        "regex",
        "lsp",
        "treesitter",
      },
      filetypes_denylist = {
        "neo-tree",
        "NvimTree",
      },
    }
  end,
}
