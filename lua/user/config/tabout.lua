local send_key = require("user.utils").send_key

require("tabout").setup {
  tabkey = "",
  backwards_tabkey = "",
}

map("i", "<Tab>", function()
  local ok, luasnip = pcall(require, "luasnip")
  if ok and luasnip.expand_or_locally_jumpable() then
    send_key "<Plug>luasnip-expand-or-jump"
  else
    send_key "<Plug>(Tabout)"
  end
end)
map("i", "<S-Tab>", function()
  local ok, luasnip = pcall(require, "luasnip")
  if ok and luasnip.locally_jumpable(-1) then
    send_key "<Plug>luasnip-jump-prev"
  else
    send_key "<Plug>(TaboutBack)"
  end
end)
