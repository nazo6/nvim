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
    for _, quote in ipairs { '"', "'", "`" } do
      -- jump_out
      insx.add(
        quote,
        jump_next {
          jump_pat = {
            [[\\\@<!\%#]] .. esc(quote) .. [[\zs]],
          },
        }
      )
      insx.add(quote, auto_pair.strings { open = quote, close = quote })
      insx.add("<BS>", delete_pair.strings { open_pat = esc(quote), close_pat = esc(quote) })
      insx.add("<C-h>", delete_pair.strings { open_pat = esc(quote), close_pat = esc(quote) })

      insx.add("<C-]>", fast_wrap { close = quote })
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

    -- tags.
    insx.add(
      "<CR>",
      require "insx.recipe.fast_break" {
        open_pat = insx.helper.search.Tag.Open,
        close_pat = insx.helper.search.Tag.Close,
      }
    )
  end,
}
