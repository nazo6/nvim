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
        vim.notify = require "notify"
      end,
    }

    use { "vim-jp/vimdoc-ja" }
    use { "nathom/filetype.nvim" }
    use {
      "monkoose/matchparen.nvim",
      config = function()
        require("matchparen").setup()
      end,
    }

    ----------
    -- Code --
    ----------
    use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require "rc.treesitter"
      end,
      requires = "romgrk/nvim-treesitter-context",
    }

    use "folke/lua-dev.nvim"
    use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }
    use { "ray-x/lsp_signature.nvim" }
    use { "tami5/lspsaga.nvim" }
    use {
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
    }
    use {
      "ldelossa/litee.nvim",
      config = function()
        require("litee").setup {}
      end,
    }
    use { "onsails/lspkind-nvim" }
    use { "folke/lsp-colors.nvim" }
    use { "nvim-lua/lsp-status.nvim" }
    use { "jose-elias-alvarez/nvim-lsp-ts-utils" }
    use { "williamboman/nvim-lsp-installer" }
    use { "nazo6/installer.nvim" }
    use { "b0o/schemastore.nvim" }
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require "rc.installer"
        require "rc.lsp.setup"
      end,
    }

    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require "rc.luasnip"
      end,
    }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        require "rc.cmp"
      end,
    }

    use {
      "puremourning/vimspector",
      ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      config = function()
        vim.g.vimspector_install_gadgets = { "vscode-node-debug2" }
        vim.g.vimspector_enable_mappings = "HUMAN"
      end,
    }
    use {
      "mfussenegger/nvim-dap",
      module = { "dap" },
      config = function()
        require "rc.dap"
      end,
    }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, module = { "dapui" } }

    -----------
    -- Edits --
    -----------
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "rc.indentLine"
      end,
    }
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {
          enable_check_bracket_line = false,
        }
      end,
    }
    use {
      "windwp/nvim-ts-autotag",
      ft = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "xml",
        "php",
      },
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    }

    -----------
    -- Utils --
    -----------
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "telescope",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      setup = function()
        require("rc.telescope").keymaps()
      end,
      config = function()
        require("rc.telescope").setup()
      end,
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      cmd = { "NvimTree*" },
      setup = function()
        require("rc.nvim-tree").keymap()
      end,
      config = function()
        require("rc.nvim-tree").setup()
      end,
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      module = "trouble",
      setup = function()
        require("rc.trouble").keymap()
      end,
      config = function()
        require("rc.trouble").setup()
      end,
    }
    use {
      "akinsho/toggleterm.nvim",
      config = function()
        require "rc.toggleterm"
      end,
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
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
      "windwp/nvim-spectre",
      module = { "spectre" },
      setup = function()
        require("rc.spectre").keymap()
      end,
      config = function()
        require("rc.spectre").setup()
      end,
    }
    use {
      "matbme/JABS.nvim",
      cmd = "JABSOpen",
      setup = function()
        require("rc.JABS").keymaps()
      end,
      config = function()
        require("rc.JABS").setup()
      end,
    }
    use {
      "tversteeg/registers.nvim",
      cmd = "Registers",
      keys = { [["]], "<C-r>" },
    }
    use {
      "NTBBloodbath/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      ft = { "http" },
    }

    ------------------------
    -- Appearance plugins --
    ------------------------
    use { "rebelot/kanagawa.nvim" }
    use {
      "windwp/windline.nvim",
      config = function()
        require "rc.windline"
      end,
    }
    use { "dstein64/nvim-scrollview" }
    use {
      "akinsho/nvim-bufferline.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "rc.bufferline"
      end,
    }
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

    use { "simrat39/rust-tools.nvim" }
    use {
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("crates").setup()
      end,
    }
    use {
      "vuki656/package-info.nvim",
      event = { "BufRead package.json" },
      requires = "MunifTanjim/nui.nvim",
    }

    use {
      "akinsho/flutter-tools.nvim",
      requires = { "akinsho/plenary.nvim" },
      ft = { "dart" },
      config = function()
        require "rc.flutter"
      end,
    }
    ---------
    -- Dev --
    ---------
    use { "nazo6/dui.nvim" }
  end,
}

require "utils.autocmd" {
  id = "PackerCompile",
  events = { "BufWritePost" },
  filetypes = "plugins.lua",
  command = "source <afile> | PackerCompile",
}
