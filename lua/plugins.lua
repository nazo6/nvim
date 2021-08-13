local packer = require 'packer'
local use = packer.use
packer.init { config = { profile = { enable = true } } }
packer.reset()
use { 'wbthomason/packer.nvim' }

use { 'vim-jp/vimdoc-ja' }

----------
-- Code --
----------
use {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require 'rc.treesitter'
  end,
}
use 'folke/lua-dev.nvim'
use { 'neovim/nvim-lspconfig' }
use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
use {
  vim.fn.stdpath 'config' .. '/lspinstall',
  requires = {
    'glepnir/lspsaga.nvim',
    'ray-x/lsp_signature.nvim',
    'onsails/lspkind-nvim',
  },
  config = function()
    require 'rc.lsp.setup'
  end,
}

use { 'folke/lsp-colors.nvim' }
use {
  'hrsh7th/nvim-compe',
  config = function()
    require 'rc.compe'
  end,
}
use {
  'puremourning/vimspector',
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  config = function()
    vim.g.vimspector_install_gadgets = { 'vscode-node-debug2' }
    vim.g.vimspector_enable_mappings = 'HUMAN'
  end,
}
use { 'mfussenegger/nvim-dap' }
use {
  'rcarriga/nvim-dap-ui',
  config = function()
    require('dapui').setup()
  end,
}

-----------
-- Edits --
-----------
use {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require 'rc.indentLine'
  end,
}
use {
  'windwp/nvim-autopairs',
  config = function()
    require 'rc.autopairs'
  end,
}
use {
  'alvan/vim-closetag',
  config = function()
    vim.cmd 'autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact'
    vim.g.closetag_filenames = '*.html,*.jsx,*.tsx'
    vim.g.closetag_emptyTags_caseSensitive = 1
    vim.g.closetag_regions = {
      ['typescript.tsx'] = 'jsxRegion,tsxRegion',
      ['javascript.jsx'] = 'jsxRegion',
      typescriptreact = 'jsxRegion,tsxRegion',
      javascriptreact = 'jsxRegion',
    }
    vim.g.closetag_shortcut = '>'
  end,
}

-----------
-- Utils --
-----------
use {
  'nvim-telescope/telescope.nvim',
  requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
  config = function()
    require('telescope').setup()
  end,
}
use {
  'lambdalisue/fern.vim',
  requires = {
    'lambdalisue/fern-git-status.vim',
    'lambdalisue/nerdfont.vim',
    'lambdalisue/fern-renderer-nerdfont.vim',
    'lambdalisue/glyph-palette.vim',
  },
  config = function()
    require 'rc.fern'
  end,
}
use {
  'folke/trouble.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require 'rc.trouble'
    require('trouble').setup {}
  end,
}
use {
  'kristijanhusak/orgmode.nvim',
  config = function()
    require('orgmode').setup { org_agenda_files = { '~/org/**/*' }, org_default_notes_file = '~/org/refile.org' }
  end,
}

use { 'voldikss/vim-floaterm', cmd = { 'FloatermNew', 'FloatermHide', 'FloatermShow' } }
use { 'folke/tokyonight.nvim' }
use {
  'hoob3rt/lualine.nvim',
  config = function()
    require 'rc.lualine'
  end,
}
use { 'dstein64/nvim-scrollview' }
use {
  'akinsho/nvim-bufferline.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require 'rc.bufferline'
  end,
}

use { 'tpope/vim-fugitive' }
use { 'airblade/vim-gitgutter' }
use {
  'TimUntersberger/neogit',
  config = function()
    require('neogit').setup {}
  end,
}

-------------------------------
-- Language specific plugins --
-------------------------------
use {
  'akinsho/flutter-tools.nvim',
  requires = { 'akinsho/plenary.nvim' },
  config = function()
    require 'rc.flutter'
  end,
}
use { 'chrisbra/csv.vim', ft = { 'csv' } }
use { 'dag/vim-fish', ft = { 'fish' } }

vim.cmd 'PackerCompile'
vim.cmd 'PackerClean'
vim.cmd 'PackerInstall'
