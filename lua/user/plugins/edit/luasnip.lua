return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    local luasnip = require "luasnip"

    luasnip.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    }

    require("luasnip/loaders/from_vscode").lazy_load()

    map("i", "<Esc>", function()
      luasnip.unlink_current()
      vim.cmd.stopinsert()
    end, { desc = "Escape snippet and stop insert mode" })
  end,
  event = "InsertEnter",
}
