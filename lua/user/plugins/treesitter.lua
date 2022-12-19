return function(use)
  use("romgrk/nvim-treesitter-context", { module = "treesitter-context" })
  use("windwp/nvim-ts-autotag", { module = "treesitter" })
  use("nvim-treesitter/nvim-treesitter-textobjects", { module = "treesitter" })

  use("nvim-treesitter/nvim-treesitter", {
    event = { "BufRead", "InsertEnter" },
    module = { "nvim-treesitter" },
    cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
    depends = { "nvim-treesitter-textobjects", "nvim-treesitter-context", "nvim-ts-autotag" },
    config = function()
      require "user.config.treesitter"
    end,
    run = ":TSUpdate",
  })
end
