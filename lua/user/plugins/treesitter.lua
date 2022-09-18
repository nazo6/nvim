return function(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "InsertEnter" },
    module = { "nvim-treesitter" },
    requires = {
      { "romgrk/nvim-treesitter-context", after = "nvim-treesitter" },
      { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
      { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
    },
    config = function()
      require "user.config.treesitter"
    end,
  }
end
