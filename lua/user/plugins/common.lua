return {
  { "jghauser/mkdir.nvim", event = { "BufWritePre" } },

  { "vim-jp/vimdoc-ja", lazy = false },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall" },
    event = { "WinNew", "WinLeave", "BufRead" },
    config = function()
      require "user.config.mason"
    end,
  },

  {
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
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require "user.config.notify"
    end,
  },
}
