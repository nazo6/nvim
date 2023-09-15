return {
  "abecodes/tabout.nvim",
  event = { "InsertEnter" },
  config = function()
    local send_key = require("user.utils").send_key

    require("tabout").setup {
      tabkey = "",
      backwards_tabkey = "",
    }

    map("i", "<Tab>", function()
      if require("luasnip").expand_or_locally_jumpable() then
        send_key "<Plug>luasnip-expand-or-jump"
      else
        send_key "<Plug>(Tabout)"
      end
    end, { desc = "Tabout or luasnip expand-or-jump" })
    map("i", "<S-Tab>", function()
      if require("luasnip").locally_jumpable(-1) then
        send_key "<Plug>luasnip-jump-prev"
      else
        send_key "<Plug>(TaboutBack)"
      end
    end, { desc = "Tabout or luasnip jump-prev" })
  end,
}
