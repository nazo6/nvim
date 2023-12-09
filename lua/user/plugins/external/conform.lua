local lsp_always_fallback_ft = { "rust" }

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
        ".prettierrc.mjs",
        ".prettierrc.toml",
        "prettier.config.js",
        "prettier.config.cjs",
      }
      require("conform.formatters.prettierd").condition = function(self, ctx)
        return not not (require("conform.formatters.prettierd").cwd(self, ctx))
      end
      require("conform.formatters.deno_fmt").condition = function(self, ctx)
        local denols = vim.iter(vim.lsp.get_clients { bufnr = ctx.buf }):find(function(c)
          return c.name == "denols"
        end)
        return not denols
      end

      vim.api.nvim_create_user_command("ConformDisable", function()
        _G.conform_disabled = true
      end, {})
      vim.api.nvim_create_user_command("ConformEnable", function()
        _G.conform_disabled = false
      end, {})

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { { "prettierd", "deno_fmt" } },
          typescript = { { "prettierd", "deno_fmt" } },
          typescriptreact = { { "prettierd", "deno_fmt" } },
          javascriptreact = { { "prettierd", "deno_fmt" } },
          markdown = { { "prettierd", "deno_fmt" } },
          json = { { "prettierd", "deno_fmt" } },
          jsonc = { { "prettierd", "deno_fmt" } },
          rust = { "dioxus_fmt" },
        },
        formatters = {
          dioxus_fmt = {
            command = "dx",
            args = { "fmt", "-f", "$FILENAME" },
            stdin = false,
            cwd = require("conform.util").root_file { "Dioxus.toml" },
            require_cwd = true,
            condition = require("conform.util").root_file { "Dioxus.toml" },
          },
        },
        format_on_save = function()
          if _G.conform_disabled then
            return
          end

          local opts = {
            lsp_fallback = true,
            timeout_ms = 1000,
          }

          if vim.iter(lsp_always_fallback_ft):find(vim.bo.filetype) then
            opts.lsp_fallback = "always"
          end

          return opts
        end,
      }
    end,
  },
}
