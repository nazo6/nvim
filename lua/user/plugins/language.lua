return function(use)
  use("teal-language/vim-teal", { ft = { "teal" } })
  use("chrisbra/csv.vim", { ft = { "csv" } })
  use("dag/vim-fish", { ft = { "fish" } })
  use("kevinoid/vim-jsonc", { ft = { "json" } })
  use("ionide/Ionide-vim", {
    on_lua = "ionide",
    setup = function()
      vim.g["fsharp#lsp_auto_setup"] = 0
    end,
  })

  use("simrat39/rust-tools.nvim", { on_lua = "rust-tools" })
  use("Saecki/crates.nvim", {
    on_event = { "BufRead Cargo.toml" },
    depends = { "plenary.nvim" },
    lua_source = [[require("crates").setup()]],
  })
  use("vuki656/package-info.nvim", {
    on_event = { "BufRead package.json" },
    depends = { "nui.nvim" },
  })

  use("akinsho/flutter-tools.nvim", {
    depends = { "plenary.nvim" },
    ft = { "dart" },
    lua_source = [[require "user.config.flutter"]],
  })
  use("NTBBloodbath/rest.nvim", {
    depends = { "plenary.nvim" },
    ft = { "http" },
  })

  use("f3fora/nvim-texlabconfig", {
    ft = { "tex", "bib" },
    cmd = { "TexlabInverseSearch" },
  })

  use("nanotee/sqls.nvim", {
    on_lua = "sqls",
    ft = { "sql" },
  })

  use("jose-elias-alvarez/typescript.nvim", {
    on_lua = "typescript",
  })

  use("ellisonleao/glow.nvim", {
    ft = { "markdown" },
    cmd = { "Glow" },
    lua_source = [[require("glow").setup {}]],
  })
end
