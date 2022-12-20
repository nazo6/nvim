return function(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "InsertEnter" },
    cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
    dependencies = {
      { "romgrk/nvim-treesitter-context", module = "treesitter-context" },
      { "windwp/nvim-ts-autotag", opt = true },
      { "nvim-treesitter/nvim-treesitter-textobjects", opt = true },
    },
    config = function()
      require "user.config.treesitter"
    end,
    run = ":TSUpdate",
  }
end
