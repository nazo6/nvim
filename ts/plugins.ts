import packer from './utils/packer';

const loadPlugins = () => {
  const use = packer.use;
  packer.init({});
  packer.reset();
  use('wbthomason/packer.nvim', {});

  use('vim-jp/vimdoc-ja');

  use('famiu/nvim-reload');

  // Lsp
  use('neovim/nvim-lspconfig', {
    requires: ['glepnir/lspsaga.nvim', 'ray-x/lsp_signature.nvim', 'onsails/lspkind-nvim'],
    config: () => {
      require('rc.lspsaga');
      require('rc.lsp');
      require('lspkind').init({});
      require('lsp_signature').on_attach();
    }
  });
  use('folke/lsp-colors.nvim');

  use('folke/nvim-compe', {
    branch: 'stylize_markdown',
    config: () => {
      require('rc.compe');
    }
  });

  use('nvim-treesitter/nvim-treesitter', {
    config: () => {
      require('rc.treesitter');
    }
  });

  use('puremourning/vimspector', {
    ft: ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
    config: () => {
      vim.g.vimspector_install_gadgets = ['vscode-node-debug2'];
      vim.g.vimspector_enable_mappings = 'HUMAN';
    }
  });

  use('voldikss/vim-floaterm', {
    cmd: ['FloatermNew', 'FloatermHide', 'FloatermShow']
  });

  //Appearance
  use('folke/tokyonight.nvim');
  use('hoob3rt/lualine.nvim', {
    config: () => {
      require('rc.lualine');
    }
  });
  use('dstein64/nvim-scrollview');
  use('akinsho/nvim-bufferline.lua', {
    requires: 'kyazdani42/nvim-web-devicons',
    config: () => {
      require('rc.bufferline');
    }
  });

  //git
  use('tpope/vim-fugitive');
  use('airblade/vim-gitgutter');
  use('rbong/vim-flog', {
    cmd: ['Flog', 'FlogSplit']
  });

  //operate
  use('phaazon/hop.nvim', {
    config: () => {}
  });

  //code common
  use('lukas-reineke/indent-blankline.nvim', {
    branch: 'lua',
    config: () => {
      require('rc.indentLine');
    }
  });
  use('rstacruz/vim-closer');
  use('alvan/vim-closetag', {
    config: () => {
      vim.cmd('autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact');
      vim.g.closetag_filenames = '*.html,*.jsx,*.tsx';
      vim.g.closetag_emptyTags_caseSensitive = 1;
      vim.g.closetag_regions = {
        'typescript.tsx': 'jsxRegion,tsxRegion',
        'javascript.jsx': 'jsxRegion',
        typescriptreact: 'jsxRegion,tsxRegion',
        javascriptreact: 'jsxRegion'
      };
      vim.g.closetag_shortcut = '>';
    }
  });
  /*use('RRethy/vim-hexokinase', {
    run: 'make hexokinase'
  });*/

  //Tools
  use('nvim-telescope/telescope.nvim', {
    requires: ['nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'],
    config: () => {
      require('telescope').setup();
    }
  });
  use('numToStr/Navigator.nvim', {
    config: () => {
      require('rc.Navigator');
    }
  });
  /*use('kyazdani42/nvim-tree.lua', {
    requires: 'kyazdani42/nvim-web-devicons'
  });*/
  use('lambdalisue/fern.vim', {
    requires: [
      'lambdalisue/fern-git-status.vim',
      'lambdalisue/nerdfont.vim',
      'lambdalisue/fern-renderer-nerdfont.vim',
      'lambdalisue/glyph-palette.vim'
    ],
    config: () => {
      require('rc.fern');
    }
  });

  use('folke/trouble.nvim', {
    requires: 'kyazdani42/nvim-web-devicons',
    config: () => {
      require('rc.trouble');
      require('trouble').setup({});
    }
  });

  use('kristijanhusak/orgmode.nvim', {
    config: () => {
      require('orgmode').setup({
        org_agenda_files: ['~/org/**/*'],
        org_default_notes_file: '~/org/refile.org'
      });
    }
  });

  //Language specific plugins
  use('chrisbra/csv.vim', {
    ft: ['csv']
  });
  use('dag/vim-fish', {
    ft: ['fish']
  });

  vim.cmd('PackerCompile');
  vim.cmd('PackerClean');
  vim.cmd('PackerInstall');
};
export default loadPlugins;
