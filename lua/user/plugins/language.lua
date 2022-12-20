return function(use)
  use { "teal-language/vim-teal", ft = { "teal" } }
  use { "chrisbra/csv.vim", ft = { "csv" } }
  use { "dag/vim-fish", ft = { "fish" } }
  use { "kevinoid/vim-jsonc", ft = { "json" } }
  use {
    "ionide/Ionide-vim",

    init = function()
      vim.g["fsharp#lsp_auto_setup"] = 0
    end,
  }

  use { "simrat39/rust-tools.nvim" }
  use {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup()
    end,
  }
  use {
    "vuki656/package-info.nvim",
    event = { "BufRead package.json" },
    dependencies = { { "MunifTanjim/nui.nvim" } },
  }

  use {
    "akinsho/flutter-tools.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    ft = { "dart" },
    config = function()
      require "user.config.flutter"
    end,
  }
  use {
    "NTBBloodbath/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
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

    ft = { "sql" },
  }

  use {
    "jose-elias-alvarez/typescript.nvim",
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
