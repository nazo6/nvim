return function(use)
  use { "jghauser/mkdir.nvim", event = { "BufWritePre" } }

  use { "vim-jp/vimdoc-ja", lazy = false }

  use {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall" },
    event = { "WinNew", "WinLeave" },
    config = function()
      require "user.config.mason"
    end,
  }

  use {
    "folke/noice.nvim",
    event = "VimEnter",
    keys = { ":", "/" },
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      { "rcarriga/nvim-notify" },
    },
    config = function()
      require "user.config.noice"
    end,
  }
end
