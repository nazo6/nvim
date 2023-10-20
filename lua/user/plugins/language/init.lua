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

  { "vxpm/ferris.nvim" },
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
    config = function()
      require("package-info").setup {
        icons = {
          enable = true,
          style = {
            up_to_date = "   ",
            outdated = "   ",
          },
        },
      }
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

  { "yioneko/nvim-vtsls" },

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

  { "Hoffs/omnisharp-extended-lsp.nvim" },
}
