local sources_default = { "lazydev", "lsp", "path", "snippets", "buffer" }
if Args.feature.ai.copilot then
  table.insert(sources_default, "copilot")
end

local source_priority = {
  copilot = 6,
  lazydev = 5,
  lsp = 4,
  path = 3,
  snippets = 2,
  buffer = 1,
}

---@type table<string, blink.cmp.SourceProviderConfigPartial>
local sources_providers = {
  lazydev = {
    name = "LazyDev",
    module = "lazydev.integrations.blink",
  },
  lsp = {
    fallbacks = {},
    async = true,
  },
}
if Args.feature.ai.copilot == true then
  sources_providers.copilot = {
    name = "copilot",
    module = "blink-copilot",
    score_offset = 1,
    async = true,
    transform_items = function(_, items)
      for _, item in ipairs(items) do
        item.copilot = true
      end
      return items
    end,
  }
end

return {
  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot", enabled = (Args.feature.ai.copilot == true) },
    event = { "InsertEnter", "CmdlineEnter" },
    version = "v1.*",
    enabled = not Args.feature.vscode,

    config = function()
      -- HACK: I found that <C-n> and <C-p> mapping is not working after pressing <C-n> when there is no completion candidates (Maybe related to https://github.com/neovim/neovim/issues/9905).
      -- By manually mapping them to blink.cmp functions, it works.
      map("i", "<C-n>", function()
        require("blink.cmp").select_next()
      end)
      map("i", "<C-p>", function()
        require("blink.cmp").select_prev()
      end)

      require("blink.cmp").setup {
        keymap = {
          preset = "none",
          ["<C-p>"] = { "select_prev" },
          ["<C-n>"] = { "select_next" },
          ["<CR>"] = { "accept", "fallback" },
          ["<C-d>"] = { "scroll_documentation_down", "fallback" },
          ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        },
        fuzzy = {
          implementation = "lua",
          sorts = {
            function(a, b)
              local a_priority = source_priority[a.source_id]
              if not a_priority then
                a_priority = 0
              end
              local b_priority = source_priority[b.source_id]
              if not b_priority then
                b_priority = 0
              end
              if a_priority ~= b_priority then
                return a_priority > b_priority
              end
            end,
            "score",
            "sort_text",
          },
        },
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = "mono",
        },
        completion = {
          list = {
            selection = {
              auto_insert = true,
              preselect = false,
            },
          },
          menu = {
            draw = {
              columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
              components = {
                kind_icon = {
                  text = function(ctx)
                    local icon = ctx.kind_icon
                    if ctx.item.copilot then
                      icon = " "
                    end
                    return icon .. ctx.icon_gap
                  end,
                },
                source_name = {
                  text = function(ctx)
                    if ctx.source_name == "LSP" then
                      return "[" .. vim.lsp.get_client_by_id(ctx.item.client_id).name .. "]"
                    else
                      return ctx.source_name
                    end
                  end,
                },
              },
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 50,
            window = {
              border = "rounded",
            },
          },
        },
        sources = {
          default = sources_default,
          providers = sources_providers,
        },
        snippets = {
          preset = "luasnip",
        },
        signature = { enabled = true },

        cmdline = {
          keymap = {
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
          },
          completion = {
            list = {
              selection = {
                auto_insert = true,
                preselect = false,
              },
            },
            menu = {
              auto_show = true,
              draw = {
                columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
              },
            },
          },
        },
      }
    end,
  },
}
