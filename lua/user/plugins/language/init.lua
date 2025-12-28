return Args.feature.vscode and {}
  or {
    { "teal-language/vim-teal", ft = { "teal" } },
    {
      "hat0uma/csvview.nvim",
      ft = { "csv", "tsv" },
      config = function()
        vim.api.nvim_create_autocmd("BufRead", {
          group = vim.api.nvim_create_augroup("csvview", {}),
          pattern = "*.csv,*.tsv",
          callback = function()
            require("csvview").enable()
          end,
        })

        require("csvview").setup()
      end,
    },
    { "dag/vim-fish", ft = { "fish" } },
    { "kevinoid/vim-jsonc", ft = { "json" } },
    {
      "ionide/Ionide-vim",

      init = function()
        vim.g["fsharp#lsp_auto_setup"] = 0
      end,
    },

    { "vxpm/ferris.nvim", ft = "rust", opts = {} },
    {
      "Saecki/crates.nvim",
      event = { "BufReadPre Cargo.toml" },
      dependencies = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("crates").setup {
          lsp = {
            enabled = true,
            actions = true,
            completion = true,
            hover = true,
          },
        }
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
      "rest-nvim/rest.nvim",
      ft = { "http" },
      cmd = { "Rest" },
      dependencies = { { "nvim-treesitter/nvim-treesitter" } },
      enabled = Args.feature.rest,
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
      "dmmulroy/tsc.nvim",
      cmd = "TSC",
      opts = {},
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

    { "Hoffs/omnisharp-extended-lsp.nvim" },

    {
      "chomosuke/typst-preview.nvim",
      ft = "typst",
      version = "1.*",
      build = function()
        require("typst-preview").update()
      end,
      opts = {
        dependencies_bin = { ["tinymist"] = "tinymist" },
        get_root = function(fname)
          return require("user.shared.utils.typst").get_typst_root_dir(fname)
        end,
        get_main_file = function(path)
          return require("user.shared.utils.typst").get_typst_main_file(path)
        end,
      },
    },

    {
      "folke/lazydev.nvim",
      ft = "lua",
      dependencies = {
        { "gonstoll/wezterm-types", lazy = true },
      },
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          { path = "snacks.nvim", words = { "Snacks" } },
          { path = "wezterm-types", mods = { "wezterm" } },
        },
      },
    },
  }
