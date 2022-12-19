return function(use)
  use("romgrk/nvim-treesitter-context", { on_lua = "treesitter-context" })
  use("windwp/nvim-ts-autotag", { on_lua = "treesitter" })
  use("nvim-treesitter/nvim-treesitter-textobjects", { on_lua = "treesitter" })

  use("nvim-treesitter/nvim-treesitter", {
    on_event = { "BufRead", "InsertEnter" },
    on_lua = { "nvim-treesitter" },
    on_cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
    depends = { "nvim-treesitter-textobjects", "nvim-treesitter-context", "nvim-ts-autotag" },
    lua_source = [[require "user.config.treesitter"]],
    lua_done_update = [[vim.cmd"TSUpdate"]],
  })
end
