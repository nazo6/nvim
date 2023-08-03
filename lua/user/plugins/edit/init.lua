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
    dependencies = { { "JoosepAlviste/nvim-ts-context-commentstring" } },
    event = { "BufRead" },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
}
