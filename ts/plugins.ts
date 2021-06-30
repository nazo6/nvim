import packer from './utils/packer';

const loadPlugins = () => {
  const use = packer.use;
  packer.init({});
  packer.reset();
  use('wbthomason/packer.nvim', {});

  use('vim-jp/vimdoc-ja');

  use('famiu/nvim-reload');

  use('nvim-treesitter/nvim-treesitter', {
    config: () => {
      require('rc.treesitter');
    }
  });
  use('neoclide/coc.nvim', {
    branch: 'release',
    config: () => {
      require('rc.coc');
    }
  });

  use('puremourning/vimspector', {
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
  use('airblade/vim-gitgutter');
  use('TimUntersberger/neogit', {
    config: () => {
      require('neogit').setup({});
    }
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
  use('fannheyward/telescope-coc.nvim', {
    config: () => {
      require('telescope').load_extension('coc');
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
