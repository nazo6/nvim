return function(use)
  use("teal-language/vim-teal", { on_ft = { "teal" } })
  use("chrisbra/csv.vim", { on_ft = { "csv" } })
  use("dag/vim-fish", { on_ft = { "fish" } })
  use("kevinoid/vim-jsonc", { on_ft = { "json" } })
  use("ionide/Ionide-vim", {
    on_lua = "ionide",
    lua_add = [[vim.g["fsharp#lsp_auto_setup"] = 0]],
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
    on_ft = { "dart" },
    lua_source = [[require "user.config.flutter"]],
  })
  use("NTBBloodbath/rest.nvim", {
    depends = { "plenary.nvim" },
    on_ft = { "http" },
  })

  use("f3fora/nvim-texlabconfig", {
    on_ft = { "tex", "bib" },
    cmd = { "TexlabInverseSearch" },
  })

  use("nanotee/sqls.nvim", {
    on_lua = "sqls",
    on_ft = { "sql" },
  })

  use("jose-elias-alvarez/typescript.nvim", {
    on_lua = "typescript",
  })

  use("ellisonleao/glow.nvim", {
    on_ft = { "markdown" },
    cmd = { "Glow" },
    lua_source = [[require("glow").setup {}]],
  })
end
