return {
  { "jghauser/mkdir.nvim", event = { "BufWritePre" } },

  { "vim-jp/vimdoc-ja", event = { "CmdlineEnter" } },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall" },
    event = { "WinNew", "BufRead", "InsertEnter" },
    config = function()
      require "user.config.mason"
    end,
  },

  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   keys = { ":", "/" },
  --   config = function()
  --     require "user.config.noice"
  --   end,
  -- },

  { "MunifTanjim/nui.nvim" },
  {
    "rcarriga/nvim-notify",
    init = function()
      require("user.config.notify").init()
    end,
    config = function()
      require("user.config.notify").config()
    end,
  },
  {
    "jedrzejboczar/possession.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require "user.config.possession"
    end,
  },
}
