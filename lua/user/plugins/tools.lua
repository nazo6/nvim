return function(use)
  use("nvim-telescope/telescope.nvim", {
    on_cmd = "Telescope",
    on_lua = "telescope",
    depends = { "plenary.nvim" },
    lua_add = [[require("user.config.telescope").setup()]],
    lua_source = [[require("user.config.telescope").config()]],
  })

  use("jvgrootveld/telescope-zoxide", {
    opt = true,
  })

  use("kyazdani42/nvim-tree.lua", {
    depends = { "nvim-web-devicons" },
    on_cmd = { "NvimTreeToggle" },
    lua_add = [[require("user.config.nvim-tree").setup()]],
    lua_source = [[require("user.config.nvim-tree").config()]],
  })

  use("s1n7ax/nvim-window-picker", {
    rev = "1.*",
    on_lua = "window-picker",
    lua_source = [[require "user.config.window-picker"]],
  })
  use("nvim-neo-tree/neo-tree.nvim", {
    depends = {
      "nvim-web-devicons",
      "plenary.nvim",
      "nui.nvim",
      "nvim-window-picker",
    },
    on_cmd = { "Neotree" },
    lua_add = [[require("user.config.neo-tree").setup()]],
    lua_source = [[require("user.config.neo-tree").config()]],
  })

  use("folke/trouble.nvim", {
    depends = { "nvim-web-devicons" },
    on_cmd = "Trouble*",
    lua_add = [[require("user.config.trouble").setup()]],
    lua_source = [[require("user.config.trouble").config()]],
  })
  use("stevearc/aerial.nvim", {
    on_event = "BufRead",
    on_cmd = "Aerial*",
    lua_add = [[require("user.config.aerial").setup()]],
    lua_source = [[require("user.config.aerial").config()]],
  })
  use("akinsho/toggleterm.nvim", {
    on_lua = "toggleterm",
    on_cmd = { "ToggleTerm", "ToggleTerm*" },
    lua_add = [[require("user.config.toggleterm").setup()]],
    lua_source = [[require("user.config.toggleterm").config()]],
  })

  use("lewis6991/gitsigns.nvim", {
    depends = { "plenary.nvim" },
    on_event = "BufRead",
    on_cmd = "GitSigns",
    lua_source = [[require("gitsigns").setup()]],
  })
  use("TimUntersberger/neogit", {
    on_cmd = { "Neogit" },
    on_lua = { "neogit" },
    lua_source = [[
      require("neogit").setup {
        enhanced_diff_hl = true,
        integrations = {
          diffview = true,
        },
        signs = {
          section = { "", "" },
          item = { "", "" },
        },
      }
    ]],
  })
  use("sindrets/diffview.nvim", {
    depends = { "plenary.nvim" },
    on_cmd = { "DiffviewOpen" },
    on_lua = "diffview",
  })

  use("windwp/nvim-spectre", {
    on_lua = { "spectre" },
    lua_add = [[require("user.config.spectre").setup()]],
    lua_source = [[require("user.config.spectre").config()]],
  })

  --  use("matbme/JABS.nvim", {
  --    on_cmd = "JABSOpen",
  --      lua_add = [[require("user.config.jabs").setup()]],
  --      lua_source = [[require("user.config.jabs").config()]]
  --  })

  use("kevinhwang91/nvim-hlslens", {
    on_event = { "BufRead" },
    lua_add = [[require("user.config.hlslens").setup()]],
    lua_source = [[require("user.config.hlslens").config()]],
    on_lua = { "hlslens" },
  })

  use("zbirenbaum/copilot.lua", {
    on_event = "VimEnter",
    lua_source = [[
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    ]],
  })

  use("uga-rosa/ccc.nvim", {
    on_cmd = { "CccPick" },
  })

  --[=[
  use("ldelossa/nvim-ide", {
    on_lua = { "ide" },
    on_cmd = { "Workspace" },
    lua_add = [[require("user.config.ide").setup()]],
    lua_source = [[require("user.config.ide").config()]],
  })
  ]=]
end
