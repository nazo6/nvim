return {
  { "teal-language/vim-teal", ft = { "teal" } },
  { "chrisbra/csv.vim", ft = { "csv" } },
  { "dag/vim-fish", ft = { "fish" } },
  { "kevinoid/vim-jsonc", ft = { "json" } },
  {
    "ionide/Ionide-vim",

    init = function()
      vim.g["fsharp#lsp_auto_setup"] = 0
    end,
  },

  { "simrat39/rust-tools.nvim" },
  {
    "Saecki/crates.nvim",
    event = { "BufReadPre Cargo.toml" },
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup()
    end,
  },
  {
    "vuki656/package-info.nvim",
    event = { "BufRead package.json" },
    dependencies = { { "MunifTanjim/nui.nvim" } },
  },

  {
    "akinsho/flutter-tools.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    ft = { "dart" },
    config = function()
      require "user.config.flutter"
    end,
  },
  {
    "NTBBloodbath/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    ft = { "http" },
  },

  {
    "f3fora/nvim-texlabconfig",
    config = function()
      require("texlabconfig").setup()
    end,
    ft = { "tex", "bib" },
    cmd = { "TexlabInverseSearch" },
  },

  {
    "nanotee/sqls.nvim",

    ft = { "sql" },
  },

  {
    "jose-elias-alvarez/typescript.nvim",
  },

  {
    "ellisonleao/glow.nvim",
    ft = { "markdown" },
    cmd = { "Glow" },
    config = function()
      require("glow").setup {
        border = "single",
      }
    end,
  },
}
