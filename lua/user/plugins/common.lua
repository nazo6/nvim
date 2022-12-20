return function(use)
  use { "lewis6991/impatient.nvim" }

  use { "jghauser/mkdir.nvim", event = { "BufWritePre" } }

  use { "vim-jp/vimdoc-ja" }

  use {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall" },
    config = function()
      require "user.config.mason"
    end,
  }

  use {
    "folke/noice.nvim",
    event = "VimEnter",
    keys = { ":", "/" },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      { "MunifTanjim/nui.nvim", module = "nui" },
      { "rcarriga/nvim-notify", module = "notify" },
    },
    config = function()
      require "user.config.noice"
    end,
  }
end
