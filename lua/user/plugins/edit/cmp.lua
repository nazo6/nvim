local sources_default = { "lazydev", "lsp", "path", "snippets", "buffer" }
if Args.feature.copilot then
  table.insert(sources_default, "copilot")
end

---@type table<string, blink.cmp.SourceProviderConfigPartial>
local sources_providers = {
  lazydev = {
    name = "LazyDev",
    module = "lazydev.integrations.blink",
    score_offset = 10,
  },
  lsp = {
    fallbacks = {},
    async = true,
  },
}
if Args.feature.copilot then
  sources_providers.copilot = {
    name = "copilot",
    module = "blink-cmp-copilot",
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
    dependencies = {
      { "giuxtaposition/blink-cmp-copilot", enabled = Args.feature.copilot },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    version = "*",
    enabled = not Args.feature.vscode,

    config = function()
      require("blink.cmp").setup {
        keymap = {
          preset = "none",
          ["<C-p>"] = { "select_prev", "fallback" },
          ["<C-n>"] = { "select_next", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
          ["<C-d>"] = { "scroll_documentation_down", "fallback" },
          ["<C-u>"] = { "scroll_documentation_up", "fallback" },
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
          trigger = {
            show_on_blocked_trigger_characters = function()
              return {}
            end,
          },
          menu = {
            draw = {
              columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
              components = {
                kind_icon = {
                  text = function(ctx)
                    local icon = ctx.kind_icon
                    if ctx.item.copilot then
                      icon = ""
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
            menu = {
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
