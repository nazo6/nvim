return function(use)
  -----------------------
  -- Window management --
  -----------------------
  use {
    "tkmpypy/chowcho.nvim",
    module = "chowcho",
    setup = function()
      require("user.config.chowcho").setup()
    end,
    config = function()
      require("user.config.chowcho").config()
    end,
  }
  use {
    "mrjones2014/smart-splits.nvim",
    module = "smart-splits",
    setup = function()
      require("user.config.smart-splits").setup()
    end,
    config = function()
      require("user.config.smart-splits").config()
    end,
  }

  -----------
  -- Tools --
  -----------
  use { "sbulav/nredir.nvim", cmd = { "Nredir" } }
  use { "dstein64/vim-startuptime", cmd = { "StartupTime" } }
  use {
    "nanotee/zoxide.vim",
    cmd = { "Z" },
  }
end
