local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.api.nvim_command "packadd packer.nvim"
end

local packer = require "packer"

packer.startup {
  function(use)
    use { "wbthomason/packer.nvim" }

    ------------------------------------------
    -- Global plugins --
    ------------------------------------------
    use { "lewis6991/impatient.nvim" }
    use {
      "rcarriga/nvim-notify",
      module = "notify",
      setup = function()
        require("user.config.notify").setup()
      end,
      config = function()
        require("user.config.notify").config()
      end,
    }

    use { "jghauser/mkdir.nvim", event = { "BufWritePre" } }

    use { "vim-jp/vimdoc-ja" }

    ----------
    -- Code --
    ----------
    use {
      "nvim-treesitter/nvim-treesitter",
      event = { "BufRead", "InsertEnter" },
      module = { "nvim-treesitter" },
      requires = {
        { "romgrk/nvim-treesitter-context", after = "nvim-treesitter" },
        { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
        { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
      },
      config = function()
        require "user.config.treesitter"
      end,
    }

    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
      module = "null-ls",
      after = "mason.nvim",
    }
    use {
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
      config = function()
        vim.g.code_action_menu_show_details = false
      end,
    }
    use {
      "neovim/nvim-lspconfig",
      module = "lspconfig",
      cmd = { "LspInfo", "LspLog" },
      event = { "BufRead" },
      config = function()
        require "user.config.lsp.setup"
      end,
    }
    use { "ray-x/lsp_signature.nvim", module = "lsp_signature" }
    use { "onsails/lspkind-nvim", module = "lspkind" }
    use { "folke/lua-dev.nvim", module = "lua-dev" }
    use { "jose-elias-alvarez/nvim-lsp-ts-utils", module = "nvim-lsp-ts-utils" }
    use { "b0o/schemastore.nvim", module = "schemastore" }
    use { "j-hui/fidget.nvim", module = "fidget" }
    use { "SmiteshP/nvim-navic", module = "nvim-navic" }
    use {
      "mrshmllow/document-color.nvim",
      module = "document-color",
      config = function()
        require "user.config.document-color"
      end,
    }
    use {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      after = "nvim-lspconfig",
      as = "lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
      end,
    }
    use { "tamago324/nlsp-settings.nvim", module = "nlspsettings", cmd = "LspSettings" }
    use {
      "williamboman/mason.nvim",
      module = { "mason" },
      cmd = { "Mason", "MasonInstall", "Mason*" },
      config = function()
        require "user.config.mason"
      end,
    }
    use { "williamboman/mason-lspconfig.nvim", module = { "mason-lspconfig" } }
    use { "WhoIsSethDaniel/mason-tool-installer.nvim", module = { "mason-tool-installer" } }

    --[[
    use {
      "kevinhwang91/nvim-ufo",
      requires = {
        { "kevinhwang91/promise-async", module = { "promise-async", "promise", "async" } },
      },
      event = { "BufRead" },
      config = function()
        require("ufo").setup()
      end,
    }
    ]]

    use {
      "L3MON4D3/LuaSnip",
      requires = {
        { "rafamadriz/friendly-snippets" },
      },
      config = function()
        require "user.config.luasnip"
      end,
      event = "InsertEnter",
    }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
        { "hrsh7th/cmp-calc", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
        {
          "zbirenbaum/copilot-cmp",
          after = { "nvim-cmp" },
          config = function()
            require("copilot_cmp").setup()
          end,
        },
      },
      event = { "InsertEnter", "CmdlineEnter" },
      cmd = { "CmpStatus" },
      config = function()
        require "user.config.cmp"
      end,
    }

    use {
      "mfussenegger/nvim-dap",
      module = { "dap" },
      config = function()
        require "user.config.dap"
      end,
    }
    use {
      "rcarriga/nvim-dap-ui",
      module = { "dapui" },
    }
    use {
      "theHamsta/nvim-dap-virtual-text",
      module = "nvim-dap-virtual-text",
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      event = { "BufRead" },
      config = function()
        require "user.config.indent-blankline"
      end,
    }

    -----------------
    -- Move / Edit --
    -----------------
    use {
      "phaazon/hop.nvim",
      cmd = "Hop*",
      setup = function()
        require("user.config.hop").setup()
      end,
      config = function()
        require("user.config.hop").config()
      end,
    }
    use {
      "windwp/nvim-autopairs",
      event = { "InsertEnter" },
      after = { "nvim-cmp" },
      config = function()
        require("nvim-autopairs").setup {
          enable_check_bracket_line = false,
        }
      end,
    }
    use {
      "abecodes/tabout.nvim",
      event = { "InsertEnter" },
      config = function()
        require "user.config.tabout"
      end,
    }
    use {
      "echasnovski/mini.nvim",
      event = { "BufRead" },
      module = { "mini" },
      config = function()
        require "user.config.mini"
      end,
    }
    use {
      "kylechui/nvim-surround",
      config = function()
        require "user.config.surround"
      end,
    }

    use {
      "vim-skk/skkeleton",
      event = { "BufRead", "InsertEnter" },
      requires = {
        { "vim-denops/denops.vim", event = { "BufRead", "InsertEnter" } },
      },
      config = function()
        require "user.config.skkeleton"
      end,
    }

    -----------
    -- Utils --
    -----------
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "telescope",
      requires = {
        { "nvim-lua/plenary.nvim", module = "plenary" },
      },
      setup = function()
        require("user.config.telescope").setup()
      end,
      config = function()
        require("user.config.telescope").config()
      end,
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = { { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" } },
      cmd = { "NvimTree*" },
      setup = function()
        require("user.config.nvim-tree").setup()
      end,
      config = function()
        require("user.config.nvim-tree").config()
      end,
    }
    use {
      "nvim-neo-tree/neo-tree.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        { "nvim-lua/plenary.nvim", module = "plenary" },
        { "MunifTanjim/nui.nvim", module = "nui" },
        {
          "s1n7ax/nvim-window-picker",
          tag = "1.*",
          module = "window-picker",
          config = function()
            require "user.config.window-picker"
          end,
        },
      },
      cmd = { "Neotree" },
      setup = function()
        require("user.config.neo-tree").setup()
      end,
      config = function()
        require("user.config.neo-tree").config()
      end,
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end,
    }

    use {
      "folke/trouble.nvim",
      requires = { { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" } },
      cmd = "Trouble*",
      setup = function()
        require("user.config.trouble").setup()
      end,
      config = function()
        require("user.config.trouble").config()
      end,
    }
    use {
      "stevearc/aerial.nvim",
      event = "BufRead",
      cmd = "Aerial*",
      setup = function()
        require("user.config.aerial").setup()
      end,
      config = function()
        require("user.config.aerial").config()
      end,
    }
    use {
      "akinsho/toggleterm.nvim",
      module = "toggleterm",
      cmd = { "ToggleTerm", "ToggleTerm*" },
      setup = function()
        require("user.config.toggleterm").setup()
      end,
      config = function()
        require("user.config.toggleterm").config()
      end,
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        { "nvim-lua/plenary.nvim", module = "plenary" },
      },
      event = "BufRead",
      cmd = "GitSigns",
      config = function()
        require("gitsigns").setup()
      end,
    }
    use {
      "TimUntersberger/neogit",
      cmd = { "Neogit" },
      module = { "neogit" },
      config = function()
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
      end,
    }
    use {
      "sindrets/diffview.nvim",
      cmd = { "Diffview*", "DiffviewOpen" },
      module = "diffview",
    }

    use {
      "windwp/nvim-spectre",
      module = { "spectre" },
      setup = function()
        require("user.config.spectre").setup()
      end,
      config = function()
        require("user.config.spectre").config()
      end,
    }

    use {
      "matbme/JABS.nvim",
      cmd = "JABSOpen",
      setup = function()
        require("user.config.jabs").setup()
      end,
      config = function()
        require("user.config.jabs").config()
      end,
    }

    use {
      "kevinhwang91/nvim-hlslens",
      event = { "BufRead" },
      setup = function()
        require("user.config.hlslens").setup()
      end,
      config = function()
        require("user.config.hlslens").config()
      end,
      module = { "hlslens" },
    }

    use {
      "zbirenbaum/copilot.lua",
      event = "VimEnter",
      requires = { { "github/copilot.vim", cmd = "Copilot" } },
      config = function()
        vim.defer_fn(function()
          require("copilot").setup()
        end, 100)
      end,
    }

    ----------------
    -- Appearance --
    ----------------
    use "rebelot/kanagawa.nvim"
    use {
      "stevearc/dressing.nvim",
      config = function()
        require "user.config.dressing"
      end,
    }
    use {
      "feline-nvim/feline.nvim",
      config = function()
        require "user.config.feline"
      end,
    }
    use {
      "petertriho/nvim-scrollbar",
      event = { "BufRead" },
      config = function()
        require("scrollbar").setup()
        require("scrollbar.handlers.search").setup()
      end,
    }

    -----------------------
    -- Window management --
    -----------------------
    use {
      "tkmpypy/chowcho.nvim",
      module = "chowcho",
      setup = function()
        require("user.config.chowcho").setup()
      end,
      config = function()
        require("user.config.chowcho").config()
      end,
    }
    use {
      "mrjones2014/smart-splits.nvim",
      module = "smart-splits",
      setup = function()
        require("user.config.smart-splits").setup()
      end,
      config = function()
        require("user.config.smart-splits").config()
      end,
    }

    -----------
    -- Tools --
    -----------
    use { "sbulav/nredir.nvim", cmd = { "Nredir" } }
    use { "dstein64/vim-startuptime", cmd = { "StartupTime" } }
    use {
      "nanotee/zoxide.vim",
      cmd = { "Z" },
    }

    -------------------------------
    -- Language specific plugins --
    -------------------------------
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
      "ellisonleao/glow.nvim",
      ft = { "markdown" },
      cmd = { "Glow" },
      config = function()
        require("glow").setup {
          border = "single",
        }
      end,
    }
  end,
}

vim.api.nvim_create_augroup("PackerCompile", {})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = "PackerCompile",
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
  once = false,
})
