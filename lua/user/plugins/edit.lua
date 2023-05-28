return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      require "user.config.luasnip"
    end,
    event = "InsertEnter",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-calc" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-copilot", dependencies = { "github/copilot.vim" } },
      -- { "zbirenbaum/copilot-cmp", dependencies = { "zbirenbaum/copilot.lua" } },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    cmd = { "CmpStatus" },
    config = function()
      require "user.config.cmp"
    end,
  },

  {
    "hrsh7th/nvim-gtd",
    event = { "WinNew" },
    init = function()
      map("n", "gf", function()
        require("gtd").exec { command = "edit" }
      end)
    end,
    config = function()
      require("gtd").setup {}
    end,
  },
  {
    "hrsh7th/nvim-insx",
    event = { "InsertEnter" },
    config = function()
      require "user.config.insx"
    end,
  },
  {
    "ggandor/leap.nvim",
    dependencies = {
      { "tpope/vim-repeat" },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function()
      map("n", "s", "<Plug>(leap-forward-to)")
      map("n", "S", "<Plug>(leap-backward-to)")
      map("n", "gs", "<Plug>(leap-from-window)")
    end,
  },
  {
    "abecodes/tabout.nvim",
    event = { "InsertEnter" },
    config = function()
      require "user.config.tabout"
    end,
  },
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
