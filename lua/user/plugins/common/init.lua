return {
  { "jghauser/mkdir.nvim", event = { "BufWritePre" } },

  { "vim-jp/vimdoc-ja", event = { "CmdlineEnter" } },

  { "MunifTanjim/nui.nvim" },

  {
    "echasnovski/mini.icons",
    module = "nvim-web-devicons",
    version = false,
    lazy = false,
    config = function()
      require("mini.icons").setup()
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
}
