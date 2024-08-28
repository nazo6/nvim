return {
  "jedrzejboczar/possession.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  enabled = not Args.feature.vscode,
  config = function()
    require("possession").setup {
      silent = true,
      load_silent = true,
      autosave = {
        current = false,
        tmp = false,
        tmp_name = "tmp",
        on_load = true,
        on_quit = true,
      },
      commands = {
        save = "PossessionSave",
        load = "PossessionLoad",
        rename = "PossessionRename",
        close = "PossessionClose",
        delete = "PossessionDelete",
        show = "PossessionShow",
        list = "PossessionList",
        migrate = "PossessionMigrate",
      },
      plugins = {
        nvim_tree = true,
        tabby = true,
        dap = true,
        close_windows = {
          match = {
            filetype = { "no-neck-pain" },
            buftype = { "terminal" },
          },
          preserve_layout = false,
        },
        delete_hidden_buffers = {
          force = function(buf)
            return vim.api.nvim_get_option_value("buftype", { buf = buf }) == "terminal"
          end,
        },
      },
    }
  end,
}
