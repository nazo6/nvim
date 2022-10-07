return function(use)
  use { "lewis6991/impatient.nvim" }
  use {
    "rcarriga/nvim-notify",
    module = "notify",
    setup = function()
      require("user.config.notify").setup()
    end,
    config = function()
      require("user.config.notify").config()
    end,
  }

  use { "jghauser/mkdir.nvim", event = { "BufWritePre" } }

  use { "vim-jp/vimdoc-ja" }

  use {
    "williamboman/mason.nvim",
    module = { "mason" },
    cmd = { "Mason", "MasonInstall", "Mason*" },
    config = function()
      require "user.config.mason"
    end,
  }

  use {
    "folke/noice.nvim",
    event = "BufRead",
    keys = { ":", "/" },
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      { "MunifTanjim/nui.nvim", module = "nui" },
      { "rcarriga/nvim-notify", module = "notify" },
    },
    config = function()
      require "user.config.noice"
    end,
  }
end
