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
    -- Global / default alternative plugins --
    ------------------------------------------
    use { "lewis6991/impatient.nvim" }
    use { "b0o/mapx.nvim" }
    use {
      "rcarriga/nvim-notify",
      config = function()
        require "config.plugin.notify"
      end,
    }

    use { "vim-jp/vimdoc-ja" }
    use {
      "monkoose/matchparen.nvim",
      event = { "BufRead", "InsertEnter" },
      config = function()
        require("matchparen").setup()
      end,
    }

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
      },
      config = function()
        require "config.plugin.treesitter"
      end,
    }

    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
      module = "null-ls",
    }
    use {
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
      config = function()
        vim.g.code_action_menu_show_details = false
      end,
    }
    use { "neovim/nvim-lspconfig", module = "lspconfig" }
    use { "ray-x/lsp_signature.nvim", module = "lsp_signature" }
    use { "onsails/lspkind-nvim", module = "lspkind" }
    use { "folke/lua-dev.nvim", module = "lua-dev" }
    use { "jose-elias-alvarez/nvim-lsp-ts-utils", module = "nvim-lsp-ts-utils" }
    use { "b0o/schemastore.nvim", module = "schemastore" }
    use { "j-hui/fidget.nvim", module = "fidget" }
    --[[
    use {
      "tamago324/nlsp-settings.nvim",
      module = "nlspsettings",
      cmd = "Nlsp*",
      config = function()
        require "config.plugin.lsp.nlsp"
      end,
    }
    ]]
    use {
      "williamboman/nvim-lsp-installer",
      config = function()
        require "config.plugin.lsp.setup"
      end,
      cmd = "LspInstall*",
      event = { "BufRead" },
    }
    use {
      "nazo6/installer.nvim",
      module = "installer",
      cmd = { "Install", "Uninstall", "Update" },
      config = function()
        require "config.plugin.installer"
      end,
    }

    use {
      "L3MON4D3/LuaSnip",
      requires = {
        { "rafamadriz/friendly-snippets" },
      },
      config = function()
        require "config.plugin.luasnip"
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
      },
      event = { "InsertEnter", "CmdlineEnter" },
      config = function()
        require "config.plugin.cmp"
      end,
    }

    use {
      "mfussenegger/nvim-dap",
      module = { "dap" },
      config = function()
        require "config.plugin.dap"
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
        require "config.plugin.indent-blankline"
      end,
    }

    -----------
    -- Actions --
    -----------
    use {
      "phaazon/hop.nvim",
      cmd = "Hop*",
      setup = function()
        require("config.plugin.hop").setup()
      end,
      config = function()
        require("config.plugin.hop").config()
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
        require "config.plugin.tabout"
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
        require("config.plugin.telescope").setup()
      end,
      config = function()
        require("config.plugin.telescope").config()
      end,
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = { { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" } },
      cmd = { "NvimTree*" },
      setup = function()
        require("config.plugin.nvim-tree").setup()
      end,
      config = function()
        require("config.plugin.nvim-tree").config()
      end,
    }
    use {
      "folke/trouble.nvim",
      requires = { { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" } },
      cmd = "Trouble*",
      setup = function()
        require("config.plugin.trouble").setup()
      end,
      config = function()
        require("config.plugin.trouble").config()
      end,
    }
    use {
      "stevearc/aerial.nvim",
      event = "BufRead",
      cmd = "Aerial*",
      setup = function()
        require("config.plugin.aerial").setup()
      end,
      config = function()
        require("config.plugin.aerial").config()
      end,
    }
    use {
      "akinsho/toggleterm.nvim",
      module = "toggleterm",
      cmd = "ToggleTerm*",
      setup = function()
        require("config.plugin.toggleterm").setup()
      end,
      config = function()
        require("config.plugin.toggleterm").config()
      end,
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        { "nvim-lua/plenary.nvim", module = "plenary" },
      },
      event = "BufRead",
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
      cmd = "Diffview*",
      module = "diffview",
    }

    use {
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "config.plugin.bufferline"
      end,
    }

    use {
      "windwp/nvim-spectre",
      module = { "spectre" },
      setup = function()
        require("config.plugin.spectre").setup()
      end,
      config = function()
        require("config.plugin.spectre").config()
      end,
    }
    use {
      "tversteeg/registers.nvim",
      cmd = "Registers",
      keys = { [["]], "<C-r>" },
    }

    ------------------------
    -- Appearance plugins --
    ------------------------
    use "rebelot/kanagawa.nvim"
    use {
      "feline-nvim/feline.nvim",
      config = function()
        require "config.plugin.feline"
      end,
    }
    use { "dstein64/nvim-scrollview", event = { "BufRead" } }
    -----------
    -- Tools --
    -----------
    use { "sbulav/nredir.nvim", cmd = { "Nredir" } }
    -------------------------------
    -- Language specific plugins --
    -------------------------------
    use { "teal-language/vim-teal", ft = { "teal" } }
    use { "chrisbra/csv.vim", ft = { "csv" } }
    use { "dag/vim-fish", ft = { "fish" } }
    use { "kevinoid/vim-jsonc", ft = { "json" } }

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
        require "config.plugin.flutter"
      end,
    }
    use {
      "NTBBloodbath/rest.nvim",
      requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
      ft = { "http" },
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