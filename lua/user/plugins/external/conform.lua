return {
  {
    "stevearc/conform.nvim",
    event = { "BufRead" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local util = require "conform.util"

      require("conform.formatters.prettierd").cwd = util.root_file {
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        ".prettierrc.cjs",
        ".prettierrc.toml",
        "prettier.config.js",
        "prettier.config.cjs",
      }
      require("conform.formatters.prettierd").condition = function(ctx)
        print(require("conform.formatters.prettierd").cwd(ctx))
        return not not (require("conform.formatters.prettierd").cwd(ctx))
      end

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettierd", "deno_fmt" },
          typescript = { "prettierd", "deno_fmt" },
          typescriptreact = { "prettierd", "deno_fmt" },
          javascriptreact = { "prettierd", "deno_fmt" },
          markdown = { "prettierd", "deno_fmt" },
          json = { "prettierd", "deno_fmt" },
          jsonc = { "prettierd", "deno_fmt" },
        },
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 1000,
        },
        formatters = {
          deno_fmt = {
            command = "deno",
            args = function(ctx)
              local ft_map = {
                javascriptreact = "jsx",
                typescriptreact = "tsx",
                typescript = "ts",
                javascript = "js",
                markdown = "md",
                json = "json",
                jsonc = "jsonc",
              }
              local ft = ft_map[vim.bo[ctx.buf].filetype]
              print(ft)
              if ft ~= nil then
                return { "fmt", "--ext", ft, "-" }
              else
                return { "fmt", "-" }
              end
            end,
            stdin = true,
            condition = function(ctx)
              local denols = vim.iter(vim.lsp.get_clients { bufnr = ctx.buf }):find(function(c)
                return c.name == "denols"
              end)
              return not denols
            end,
          },
        },
      }
    end,
  },
}
