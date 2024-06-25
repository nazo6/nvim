return {
  -- Additional plugins
  {
    "romgrk/kirby.nvim",
    dependencies = {
      { "romgrk/fzy-lua-native", build = "make all" },
      { "romgrk/kui.nvim" },
    },
    cmd = "KirbyFilePicker",
  },
  -- Disable some plugins (local plugin spec is loaded last and can override config)
  {
    "aw-watcher-vim",
    enabled = false,
  },
  -- Specify dir for plugin development
  {
    "docker-compose-info.nvim",
    dir = "~/dev/neovim/docker-compose-info.nvim",
    ft = "yaml",
    config = function()
      require("docker-compose-info").setup()
    end,
  },
}
