local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.api.nvim_command "packadd packer.nvim"
end

local packer = require "packer"

packer.startup {
  function(use)
    use { "b0o/mapx.nvim" }
    use { "wbthomason/packer.nvim" }

    use { "lewis6991/impatient.nvim" }
    use { "nathom/filetype.nvim" }

    use { "vim-jp/vimdoc-ja" }

    use {
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require "notify"
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
    }
    use "folke/lua-dev.nvim"
    use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }
    use { "ray-x/lsp_signature.nvim" }
    use { "tami5/lspsaga.nvim" }
    use {
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
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

    use { "hrsh7th/vim-vsnip" }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
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

    -- use { "github/copilot.vim", event = { "BufEnter" } }

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
        require("nvim-autopairs").setup()
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
        "tsx",
        "jsx",
        "xml",
        "php",
        "glimmer",
        "handlebars",
        "hbs",
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
      config = function()
        require "rc.trouble"
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
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-gps").setup {
          separator = " > ",
        }
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

    ------------------------
    -- Appearance plugins --
    ------------------------
    use {
      "folke/tokyonight.nvim",
    }
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
    use {
      "akinsho/flutter-tools.nvim",
      requires = { "akinsho/plenary.nvim" },
      ft = { "dart" },
      config = function()
        require "rc.flutter"
      end,
    }
    use { "chrisbra/csv.vim", ft = { "csv" } }
    use { "dag/vim-fish", ft = { "fish" } }
    use {
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("crates").setup()
      end,
    }
  end,
}

require "utils.autocmd" {
  id = "PackerCompile",
  events = { "BufWritePost" },
  filetypes = "plugins.lua",
  command = "source <afile> | PackerCompile",
}
