return function(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "InsertEnter" },
    cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
    dependencies = {
      { "romgrk/nvim-treesitter-context" },
      { "windwp/nvim-ts-autotag" },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    config = function()
      require "user.config.treesitter"
    end,
    run = ":TSUpdate",
  }
end
