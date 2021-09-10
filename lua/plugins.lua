local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  execute "packadd packer.nvim"
end

local packer = require "packer"

packer.startup {
  function(use)
    use { "wbthomason/packer.nvim" }

    use { "lewis6991/impatient.nvim" }

    use { "vim-jp/vimdoc-ja" }

    --[[
    use {
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require "notify"
      end,
    }
    ]]

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
    use {
      vim.fn.stdpath "config" .. "/installer.nvim",
      requires = {
        "glepnir/lspsaga.nvim",
        "ray-x/lsp_signature.nvim",
        "onsails/lspkind-nvim",
        "folke/lsp-colors.nvim",
        "jose-elias-alvarez/nvim-lsp-ts-utils",
      },
      config = function()
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
    use { "mfussenegger/nvim-dap" }
    use {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
    }

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
      "alvan/vim-closetag",
      ft = { "html", "javascriptreact", "typescriptreact" },
      config = function()
        vim.g.closetag_filenames = "*.html,*.jsx,*.tsx"
        vim.g.closetag_emptyTags_caseSensitive = 1
        vim.g.closetag_regions = {
          ["typescript.tsx"] = "jsxRegion,tsxRegion",
          ["javascript.jsx"] = "jsxRegion",
        }
        vim.g.closetag_shortcut = ">"
      end,
    }
    use "jbyuki/venn.nvim"

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
      requires = {
        "nvim-lua/plenary.nvim",
      },
      cmd = { "Telescope" },
      module = { "telescope" },
      config = function()
        require "rc.telescope"
      end,
    }
    use {
      "lambdalisue/fern.vim",
      requires = {
        "lambdalisue/fern-git-status.vim",
        "lambdalisue/nerdfont.vim",
        "lambdalisue/fern-renderer-nerdfont.vim",
        "lambdalisue/glyph-palette.vim",
      },
      config = function()
        require "rc.fern"
      end,
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      cmd = { "Trouble*" },
      module = { "trouble" },
      config = function()
        require "rc.trouble"
      end,
    }
    use {
      "voldikss/vim-floaterm",
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
        require("neogit").setup {}
      end,
    }

    ------------------------
    -- Appearance plugins --
    ------------------------
    use { "folke/tokyonight.nvim" }
    use {
      "hoob3rt/lualine.nvim",
      config = function()
        require "rc.lualine"
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
  end,
  config = {
    profile = {
      enable = false,
    },
  },
}

vim.cmd "PackerCompile"
vim.cmd "PackerClean"
vim.cmd "PackerInstall"
