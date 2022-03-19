require("tabout").setup {
  tabkey = "",
  backwards_tabkey = "",
}

local luasnip = require "luasnip"

local function t(key)
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "")
end

inoremap("<Tab>", function()
  if luasnip.expand_or_jumpable() then
    t "<Plug>luasnip-expand-or-jump"
  else
    t "<Plug>(Tabout)"
  end
end)
inoremap("<S-Tab>", function()
  if luasnip.jumpable(-1) then
    t "<Plug>luasnip-jump-prev"
  else
    t "<Plug>(TaboutBack)"
  end
end)
