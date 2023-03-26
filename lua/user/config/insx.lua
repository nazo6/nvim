local insx = require "insx"
local esc = require("insx.helper.regex").esc

local jump_next = require "insx.recipe.jump_next"
local auto_pair = require "insx.recipe.auto_pair"
local delete_pair = require "insx.recipe.delete_pair"
local pair_spacing = require "insx.recipe.pair_spacing"
local fast_wrap = require "insx.recipe.fast_wrap"
local fast_break = require "insx.recipe.fast_break"

local function insx_add_also_c(char, recipe)
  insx.add(char, recipe)
  insx.add(char, recipe, { mode = "c" })
end

-- quotes
for _, quote in ipairs { '"', "'", "`" } do
  -- jump_out
  insx_add_also_c(
    quote,
    jump_next {
      jump_pat = {
        [[\\\@<!\%#]] .. esc(quote) .. [[\zs]],
      },
    }
  )
  insx_add_also_c(quote, auto_pair.strings { open = quote, close = quote })
  insx_add_also_c("<BS>", delete_pair.strings { open_pat = esc(quote), close_pat = esc(quote) })

  insx.add("<C-]>", fast_wrap { close = quote })
end

-- pairs
for open, close in pairs {
  ["("] = ")",
  ["["] = "]",
  ["{"] = "}",
} do
  -- jump_out
  insx_add_also_c(
    close,
    jump_next {
      jump_pat = {
        [[\%#]] .. esc(close) .. [[\zs]],
      },
    }
  )
  insx_add_also_c(open, auto_pair.strings { open = open, close = close })
  insx_add_also_c("<BS>", delete_pair { open_pat = esc(open), close_pat = esc(close) })

  insx.add("<Space>", pair_spacing.increase { open_pat = esc(open), close_pat = esc(close) })
  insx.add("<BS>", pair_spacing.decrease { open_pat = esc(open), close_pat = esc(close) })

  insx.add("<CR>", fast_break { open_pat = esc(open), close_pat = esc(close), split = true })
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
