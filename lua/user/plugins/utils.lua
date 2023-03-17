return {
  {
    "mrjones2014/smart-splits.nvim",
    init = function()
      require("user.config.smart-splits").setup()
    end,
    config = function()
      require("user.config.smart-splits").config()
    end,
  },

  { "sbulav/nredir.nvim", cmd = { "Nredir" } },
  { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
  {
    "nanotee/zoxide.vim",
    cmd = { "Z" },
  },

  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick" },
  },
}
