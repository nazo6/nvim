local send_key = require("config.utils").send_key

require("tabout").setup {
  tabkey = "",
  backwards_tabkey = "",
}

local luasnip = require "luasnip"

vim.keymap.set("i", "<Tab>", function()
  if luasnip.expand_or_jumpable() then
    send_key "<Plug>luasnip-expand-or-jump"
  else
    send_key "<Plug>(Tabout)"
  end
end)
vim.keymap.set("i", "<S-Tab>", function()
  if luasnip.jumpable(-1) then
    send_key "<Plug>luasnip-jump-prev"
  else
    send_key "<Plug>(TaboutBack)"
  end
end)
