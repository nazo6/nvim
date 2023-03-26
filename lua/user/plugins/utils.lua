return {
  {
    "mrjones2014/smart-splits.nvim",
    init = function()
      require("user.config.smart-splits").setup()
    end,
    config = function()
      require("user.config.smart-splits").config()
    end,
  },

  { "sbulav/nredir.nvim", cmd = { "Nredir" } },
  { "dstein64/vim-startuptime", cmd = { "StartupTime" } },

  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick" },
    event = { "BufRead" },
    config = function()
      require("ccc").setup {
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      }
    end,
  },

  {
    "lambdalisue/suda.vim",
    event = { "BufReadPre" },
    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },
}
