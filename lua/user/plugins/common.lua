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
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "user.config.possession"
    end,
  },
}
