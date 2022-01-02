local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "calc" },
  },
  formatting = {
    format = require("lspkind").cmp_format {
      with_text = false,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        vsnip = "[vsnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      },
    },
    fields = { "kind", "abbr", "menu" },
  },
}

cmp.setup.cmdline("/", {
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" },
  }, {
    { name = "buffer" },
  }),
})
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
