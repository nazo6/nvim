return {
  "iguanacucumber/magazine.nvim",
  name = "nvim-cmp",
  enabled = not Args.feature.vscode,
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-calc" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { "saadparwaiz1/cmp_luasnip" },
    {
      "zbirenbaum/copilot-cmp",
      enabled = Args.feature.copilot,
      config = function()
        require("copilot_cmp").setup()
      end,
    },
  },
  event = { "InsertEnter", "CmdlineEnter" },
  cmd = { "CmpStatus" },
  config = function()
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
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
          select = false,
        },
      },
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = "path" },
        { name = "calc" },
        {
          name = "lazydev",
          group_index = 0,
        },
      },
      performance = {
        fetching_timeout = 100,
      },
      formatting = {
        format = require("lspkind").cmp_format {
          menu = {
            copilot = "[copilot]",
            nvim_lsp = "[LSP]",
            luasnip = "[snippet]",
            buffer = "[buffer]",
            calc = "[calc]",
            path = "[path]",
          },
          before = function(entry, vim_item)
            if vim_item.kind == "Color" and entry.completion_item.documentation then
              local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
              if r then
                local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
                local group = "Tw_" .. color
                if vim.fn.hlID(group) < 1 then
                  vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
                end
                vim_item.kind = "■"
                vim_item.kind_hl_group = group
                return vim_item
              end
            end
            vim_item.kind = require("lspkind").symbolic(vim_item.kind) and require("lspkind").symbolic(vim_item.kind)
              or vim_item.kind
            return vim_item
          end,
        },
        fields = { "kind", "abbr", "menu" },
      },
      completion = {
        completeopt = "menu,menuone,noselect",
      },
    }

    cmp.setup.cmdline("/", {
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = "buffer" },
      }),
      mapping = cmp.mapping.preset.cmdline(),
    })
    cmp.setup.cmdline(":", {
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      mapping = cmp.mapping.preset.cmdline(),
      enabled = function()
        local is_os_cmd = vim.fn.getcmdline():sub(1, 1) == "!"
        return not is_os_cmd
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("tsnode-marker-markdown", {}),
      pattern = { "sql" },
      callback = function(ctx)
        if not not require("lazy.core.config").plugins["vim-dadbod"] then
          require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
        end
      end,
    })
  end,
}
