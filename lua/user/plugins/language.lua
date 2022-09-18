return function(use)
  use { "teal-language/vim-teal", ft = { "teal" } }
  use { "chrisbra/csv.vim", ft = { "csv" } }
  use { "dag/vim-fish", ft = { "fish" } }
  use { "kevinoid/vim-jsonc", ft = { "json" } }
  use {
    "ionide/Ionide-vim",
    module = "ionide",
    setup = function()
      vim.g["fsharp#lsp_auto_setup"] = 0
    end,
  }

  use { "simrat39/rust-tools.nvim", module = "rust-tools" }
  use {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
    config = function()
      require("crates").setup()
    end,
  }
  use {
    "vuki656/package-info.nvim",
    event = { "BufRead package.json" },
    requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
  }

  use {
    "akinsho/flutter-tools.nvim",
    requires = { { "akinsho/plenary.nvim", module = "plenary" } },
    ft = { "dart" },
    config = function()
      require "user.config.flutter"
    end,
  }
  use {
    "NTBBloodbath/rest.nvim",
    requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
    ft = { "http" },
  }

  use {
    "f3fora/nvim-texlabconfig",
    config = function()
      require("texlabconfig").setup()
    end,
    ft = { "tex", "bib" },
    cmd = { "TexlabInverseSearch" },
  }

  use {
    "nanotee/sqls.nvim",
    module = "sqls",
    ft = { "sql" },
  }

  use {
    "jose-elias-alvarez/typescript.nvim",
    module = "typescript",
  }

  use {
    "ellisonleao/glow.nvim",
    ft = { "markdown" },
    cmd = { "Glow" },
    config = function()
      require("glow").setup {
        border = "single",
      }
    end,
  }
end
