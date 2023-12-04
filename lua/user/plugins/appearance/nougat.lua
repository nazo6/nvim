return {
  "MunifTanjim/nougat.nvim",
  lazy = false,
  dependencies = { { "rebelot/kanagawa.nvim" } },
  config = function()
    require "user.plugins.appearance.nougat.setup"
  end,
}
