return {
  "MunifTanjim/nougat.nvim",
  lazy = false,
  enabled = not Args.feature.vscode,
  dependencies = { "rebelot/kanagawa.nvim", "echasnovski/mini.icons" },
  config = function()
    require "user.plugins.appearance.nougat.setup"
  end,
}
