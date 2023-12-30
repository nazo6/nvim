local web_formatter_selector = require "user.shared.formatter-selector.web"

-- Lsp server that always fallback to formatting even if it has a formatter.
--
-- This is useful for dioxus-fmt, which formats only in rsx! macro.
local lsp_always_fallback_ft = { "rust" }

-- Lsp server that is not used for formatting
local lsp_skip_format = { "lua", "vtsls", "tsserver" }

return {
  {
    "stevearc/conform.nvim",
    event = { "BufRead" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local util = require "conform.util"

      require("conform.formatters.prettierd").cwd = util.root_file(web_formatter_selector.root.prettier)
      require("conform.formatters.prettierd").condition = function(self, ctx)
        return web_formatter_selector.judge(ctx.filename, ctx.buf).type == "prettier"
      end

      require("conform.formatters.biome").cwd = util.root_file(web_formatter_selector.root.biome)
      require("conform.formatters.biome").condition = function(self, ctx)
        return web_formatter_selector.judge(ctx.filename, ctx.buf).type == "biome"
      end

      require("conform.formatters.deno_fmt").condition = function(self, ctx)
        return web_formatter_selector.judge(ctx.filename, ctx.buf).type == "deno_fmt"
      end

      vim.api.nvim_create_user_command("ConformDisable", function()
        _G.conform_disabled = true
      end, {})
      vim.api.nvim_create_user_command("ConformEnable", function()
        _G.conform_disabled = false
      end, {})

      local web_formatters = { "prettierd", "biome", "deno_fmt" }

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { web_formatters },
          typescript = { web_formatters },
          typescriptreact = { web_formatters },
          javascriptreact = { web_formatters },
          markdown = { web_formatters },
          json = { web_formatters },
          jsonc = { web_formatters },
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
            filter = function(client)
              if vim.iter(lsp_skip_format):find(client.name) then
                return false
              end
              return true
            end,
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
