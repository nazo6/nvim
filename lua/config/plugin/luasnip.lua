local luasnip = require "luasnip"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

luasnip.config.set_config {
  history = true,
  -- Update more often, :h events for more info.
  updateevents = "TextChanged,TextChangedI",
}

require("luasnip/loaders/from_vscode").lazy_load()
