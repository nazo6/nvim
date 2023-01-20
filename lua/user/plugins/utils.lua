return {
  -----------------------
  -- Window management --
  -----------------------
  {
    "tkmpypy/chowcho.nvim",
    init = function()
      require("user.config.chowcho").setup()
    end,
    config = function()
      require("user.config.chowcho").config()
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    init = function()
      require("user.config.smart-splits").setup()
    end,
    config = function()
      require("user.config.smart-splits").config()
    end,
  },

  -----------
  -- Tools --
  -----------
  { "sbulav/nredir.nvim", cmd = { "Nredir" } },
  { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
  {
    "nanotee/zoxide.vim",
    cmd = { "Z" },
  },
}
