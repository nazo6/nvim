return {
  "hrsh7th/nvim-insx",
  event = { "InsertEnter" },
  config = function()
    local insx = require "insx"
    local esc = require("insx.helper.regex").esc

    local jump_next = require "insx.recipe.jump_next"
    local auto_pair = require "insx.recipe.auto_pair"
    local delete_pair = require "insx.recipe.delete_pair"
    local pair_spacing = require "insx.recipe.pair_spacing"
    local fast_wrap = require "insx.recipe.fast_wrap"
    local fast_break = require "insx.recipe.fast_break"

    -- quotes
    for _, quote in ipairs {
      { '"', {} },
      { "'", {} },
      { "`", {} },
      { "$", { insx.with.filetype { "tex" } } },
    } do
      -- jump_out
      insx.add(
        quote[1],
        jump_next {
          jump_pat = {
            [[\\\@<!\%#]] .. esc(quote[1]) .. [[\zs]],
          },
        },
        quote[2]
      )
      print(quote[1], quote[2])
      insx.add(quote[1], insx.with(auto_pair.strings { open = quote[1], close = quote[1] }, quote[2]))
      insx.add("<BS>", insx.with(delete_pair.strings { open_pat = esc(quote[1]), close_pat = esc(quote[1]) }, quote[2]))
      insx.add(
        "<C-h>",
        insx.with(delete_pair.strings { open_pat = esc(quote[1]), close_pat = esc(quote[1]) }, quote[2])
      )

      insx.add("<C-]>", insx.with(fast_wrap { close = quote[1] }, quote[2]))
    end

    -- pairs
    for open, close in pairs {
      ["("] = ")",
      ["["] = "]",
      ["{"] = "}",
    } do
      -- jump_out
      insx.add(
        close,
        jump_next {
          jump_pat = {
            [[\%#]] .. esc(close) .. [[\zs]],
          },
        }
      )
      insx.add(open, auto_pair.strings { open = open, close = close })
      insx.add("<BS>", delete_pair { open_pat = esc(open), close_pat = esc(close) })
      insx.add("<C-h>", delete_pair { open_pat = esc(open), close_pat = esc(close) })

      insx.add("<Space>", pair_spacing.increase { open_pat = esc(open), close_pat = esc(close) })
      insx.add("<BS>", pair_spacing.decrease { open_pat = esc(open), close_pat = esc(close) })
      insx.add("<C-h>", pair_spacing.decrease { open_pat = esc(open), close_pat = esc(close) })

      insx.add("<CR>", fast_break { open_pat = esc(open), close_pat = esc(close) })
      insx.add("<C-]>", fast_wrap { close = close })
    end

    insx.add("<Tab>", {
      ---@param ctx insx.Context
      action = function(ctx)
        local row, col = ctx.row(), ctx.col()
        if require("luasnip").expand_or_locally_jumpable() then
          ctx.send "<Plug>luasnip-expand-or-jump"
        else
          if vim.iter({ [["]], "'", "]", "}", ")", "`", "$" }):find(ctx.after():sub(1, 1)) ~= nil then
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
