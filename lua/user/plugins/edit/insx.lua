return {
  "hrsh7th/nvim-insx",
  event = { "InsertEnter" },
  config = function()
    local insx = require "insx"
    local esc = require("insx.helper.regex").esc

    local auto_pair = require "insx.recipe.auto_pair"
    local fast_wrap = require "insx.recipe.fast_wrap"
    local fast_break = require "insx.recipe.fast_break"

    -- quotes
    for _, quote in ipairs { '"', "'", "`" } do
      insx.add(quote, auto_pair.strings { open = quote, close = quote })
      insx.add("<C-]>", fast_wrap { close = quote })
    end

    -- pairs
    for open, close in pairs {
      ["("] = ")",
      ["["] = "]",
      ["{"] = "}",
    } do
      insx.add(open, auto_pair.strings { open = open, close = close })
      insx.add("<CR>", fast_break { open_pat = esc(open), close_pat = esc(close) })
      insx.add("<C-]>", fast_wrap { close = close })
    end

    -- tabout
    insx.add("<Tab>", {
      ---@param ctx insx.Context
      action = function(ctx)
        local row, col = ctx.row(), ctx.col()
        if require("luasnip").expand_or_locally_jumpable() then
          ctx.send "<Plug>luasnip-expand-or-jump"
        else
          if vim.iter({ [["]], "'", "]", "}", ")", "`" }):find(ctx.after():sub(1, 1)) ~= nil then
            ctx.move(row, col + 1)
          else
            ctx.send "<Tab>"
          end
        end
      end,
    })

    -- tags.
    -- insx.add(
    --   "<CR>",
    --   require "insx.recipe.fast_break" {
    --     open_pat = insx.helper.search.Tag.Open,
    --     close_pat = insx.helper.search.Tag.Close,
    --   }
    -- )
  end,
}
