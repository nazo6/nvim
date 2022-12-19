return function(use)
  use "lewis6991/impatient.nvim"

  use("jghauser/mkdir.nvim", { on_event = { "BufWritePre" } })

  use "vim-jp/vimdoc-ja"

  use("williamboman/mason.nvim", {
    on_lua = { "mason" },
    on_cmd = { "Mason", "MasonInstall", "Mason*" },
    lua_source = [[require "user.config.mason"]],
  })

  use("MunifTanjim/nui.nvim", { on_lua = { "nui" } })
  use("rcarriga/nvim-notify", { on_lua = { "notify" } })
  use("nvim-lua/plenary.nvim", { on_lua = { "plenary" } })
  use("kyazdani42/nvim-web-devicons", { on_lua = "nvim-web-devicons" })

  use("folke/noice.nvim", {
    on_event = "VimEnter",
    on_map = { ":", "/" },
    depends = {
      "nui.nvim",
      "nvim-notify",
    },
    lua_source = [[require "user.config.noice"]],
  })
end
