return {
  {
    "kylechui/nvim-surround",
    event = { "BufRead", "InsertEnter" },
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    event = { "BufRead" },
    config = function()
      require("todo-comments").setup {}
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufRead" },
    config = function()
      require("Comment").setup()
    end,
  },
}
