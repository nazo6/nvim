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
    use { "neovim/nvim-lspconfig" }
    use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }
    use { "ray-x/lsp_signature.nvim" }
    use { "kosayoda/nvim-lightbulb" }
    use { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" }
    use { "jubnzv/virtual-types.nvim" }
    use { "onsails/lspkind-nvim" }
    use { "folke/lsp-colors.nvim" }
    use { "nvim-lua/lsp-status.nvim" }
    use { "jose-elias-alvarez/nvim-lsp-ts-utils" }
    use {
      "nazo6/installer.nvim",
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

    use { "github/copilot.vim" }

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
        require "rc.autopairs"
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
      config = function()
        require "rc.telescope"
      end,
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      cmd = { "NvimTree*" },
      config = function()
        require "rc.nvim-tree"
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
      "voldikss/vim-floaterm",
      cmd = "Floaterm*",
      config = function()
        require "rc.floaterm"
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
      config = function()
        require "rc.spectre"
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
      config = function()
        local ui = vim.api.nvim_list_uis()[1]
        require("jabs").setup {
          position = "corner",
          width = 50,
          height = 10,
          border = "shadow",
          preview_position = "left",
          preview = {
            width = 40,
            height = 30,
            border = "double",
          },
          col = ui.width,
          row = ui.height / 2,
        }
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

-- Suppress notify on packercompile
require("packer").on_compile_done = function()
  vim.cmd [[doautocmd User PackerCompileDone]]
end

require "utils.autocmd" {
  id = "PackerCompile",
  events = { "BufWritePost" },
  filetypes = "plugins.lua",
  command = "source <afile> | PackerCompile",
}

vim.cmd "PackerClean"
vim.cmd "PackerCompile"
vim.cmd "PackerInstall"
