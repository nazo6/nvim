return function(use)
  use "rafamadriz/friendly-snippets"
  use("L3MON4D3/LuaSnip", {
    depends = { "friendly-snippets" },
    lua_source = [[require "user.config.luasnip"]],
    on_event = "InsertEnter",
  })

  use("hrsh7th/cmp-buffer", { lazy = true, on_lua = { "cmp" } })
  use("hrsh7th/cmp-nvim-lsp", { lazy = true, on_lua = { "cmp", "cmp_nvim_lsp" } })
  use("hrsh7th/cmp-calc", { lazy = true, on_lua = { "cmp" } })
  use("hrsh7th/cmp-path", { lazy = true, on_lua = { "cmp" } })
  use("hrsh7th/cmp-cmdline", { lazy = true, on_lua = { "cmp" } })
  use("hrsh7th/cmp-nvim-lsp-document-symbol", { lazy = true, on_lua = { "cmp" } })
  use("saadparwaiz1/cmp_luasnip", { lazy = true, on_lua = { "cmp" } })
  use("zbirenbaum/copilot-cmp", {
    lazy = true,
    lua_source = [[require("copilot_cmp").setup()]],
    on_lua = { "cmp" },
  })
  use("hrsh7th/nvim-cmp", {
    on_event = "VimEnter",
    depends = {
      "cmp-buffer",
      "cmp-nvim-lsp",
      "cmp-calc",
      "cmp-path",
      "cmp-cmdline",
      "cmp-nvim-lsp-document-symbol",
      "cmp_luasnip",
      "copilot-cmp",
    },
    on_cmd = { "CmpStatus" },
    lua_source = [[
      vim.defer_fn(function()
        require "user.config.cmp"
      end, 300)
    ]],
  })

  use("phaazon/hop.nvim", {
    on_cmd = "Hop*",
    lua_add = [[require("user.config.hop").setup()]],
    lua_source = [[require("user.config.hop").config()]],
  })
  use("windwp/nvim-autopairs", {
    on_event = { "InsertEnter" },
    on_lua = { "nvim-autopairs" },
    lua_source = [[require("nvim-autopairs").setup {}]],
  })
  use("abecodes/tabout.nvim", {
    on_event = { "InsertEnter" },
    lua_source = [[require "user.config.tabout"]],
  })
  use("echasnovski/mini.nvim", {
    on_event = { "BufRead" },
    on_lua = { "mini" },
    lua_source = [[require "user.config.mini"]],
  })
  use("kylechui/nvim-surround", {
    on_event = { "BufRead", "InsertEnter" },
    lua_source = [[require "user.config.surround"]],
  })
end
