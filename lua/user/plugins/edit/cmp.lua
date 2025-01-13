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
}
if Args.feature.copilot then
  sources_providers.copilot = {
    name = "copilot",
    module = "blink-cmp-copilot",
    score_offset = 100,
    async = true,
    transform_items = function(_, items)
      local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
      local kind_idx = #CompletionItemKind + 1
      CompletionItemKind[kind_idx] = "Copilot"
      for _, item in ipairs(items) do
        item.kind = kind_idx
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

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "none",
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        cmdline = {
          ["<C-p>"] = { "select_prev", "fallback" },
          ["<C-n>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<Tab>"] = { "select_next", "fallback" },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",

        kind_icons = {
          Copilot = "",
          Text = "󰉿",
          Method = "",
          Function = "󰊕",
          Constructor = "󰒓",

          Field = "󰜢",
          Variable = "󰆦",
          Property = "󰖷",

          Class = "",
          Interface = "",
          Struct = "󱡠",
          Module = "󰅩",

          Unit = "󰪚",
          Value = "󰦨",
          Enum = "",
          EnumMember = "",

          Keyword = "󰻾",
          Constant = "󰏿",

          Snippet = "󱄽",
          Color = "󰏘",
          File = "󰈔",
          Reference = "󰬲",
          Folder = "󰉋",
          Event = "󱐋",
          Operator = "",
          TypeParameter = "󰬛",
        },
      },

      completion = {
        list = {
          selection = {
            auto_insert = true,
          },
        },
        trigger = {
          show_on_trigger_character = false,
        },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
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
    },
    opts_extend = { "sources.default" },
  },
}
