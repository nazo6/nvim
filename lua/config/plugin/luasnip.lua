local luasnip = require "luasnip"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

luasnip.config.set_config {
  history = true,
  -- Update more often, :h events for more info.
  updateevents = "TextChanged,TextChangedI",
}

require("luasnip/loaders/from_vscode").load()

--- <tab> to jump to next snippet's placeholder
local function on_tab()
  return luasnip.jump(1) and "" or t "<Tab>"
end

--- <s-tab> to jump to next snippet's placeholder
local function on_s_tab()
  return luasnip.jump(-1) and "" or t "<S-Tab>"
end

imap("<Tab>", on_tab, { expr = true })
smap("<Tab>", on_tab, { expr = true })
imap("<S-Tab>", on_s_tab, { expr = true })
smap("<S-Tab>", on_s_tab, { expr = true })
