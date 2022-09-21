return function(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "InsertEnter" },
    module = { "nvim-treesitter" },
    cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
    requires = {
      { "romgrk/nvim-treesitter-context", module = "treesitter-context" },
      { "windwp/nvim-ts-autotag", opt = true },
      { "nvim-treesitter/nvim-treesitter-textobjects", opt = true },
    },
    config = function()
      require "user.config.treesitter"
    end,
  }
end
