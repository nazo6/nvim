require("spectre").setup({
  find_engine = {
    ["rg"] = {
      cmd = require("installer.integrations.tools").get("ripgrep"),
    },
  },
})
