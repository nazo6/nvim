local map = require "utils.map"

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      require("installer.integrations.tools").get "ripgrep",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
  },
}

require("telescope").load_extension "neoclip"
