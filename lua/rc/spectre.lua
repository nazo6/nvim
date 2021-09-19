local get_path = require("installer.integrations.tools").get

require("spectre").setup {
  find_engine = {
    ["rg"] = {
      cmd = get_path "ripgrep",
    },
  },
  replace_engine = {
    ["sed"] = {
      cmd = get_path "sed",
    },
  },
}
