return {
  {
    "nazo6/format-order.nvim",
    event = { "BufRead" },
    dependencies = {
      {
        "stevearc/conform.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
          require("conform").setup {
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
          }
        end,
      },
    },
    config = function()
      local formatters = {
        prettierd = {
          type = "conform",
          name = "prettierd",
          root_pattern = {
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
          },
        },
        deno_fmt = { type = "conform", name = "deno_fmt", root_pattern = { "deno.json", "deno.jsonc" } },
      }

      ---@type table<string, fmo.FormatterSpecifierGroup>
      local formatter_groups = {
        web = {
          {
            specs = {
              { { type = "lsp", name = "denols" } },
              { { type = "conform", name = "biome" } },
              {
                formatters.prettierd,
                formatters.deno_fmt,
              },
            },
          },
        },
        lua = {
          {
            specs = {
              {
                { type = "conform", name = "stylua", root_pattern = { "stylua.toml" } },
                { type = "lsp", name = "lua_ls" },
              },
            },
          },
        },
        python = {
          {
            specs = {
              { { type = "conform", name = "ruff_format", root_pattern = { "pyproject.toml" } } },
            },
          },
        },
      }

      require("fmo").setup {
        filetypes = {
          html = { groups = formatter_groups.web, default = formatters.prettierd },
          css = { groups = formatter_groups.web, default = formatters.prettierd },
          javascript = { groups = formatter_groups.web, default = formatters.deno_fmt },
          typescript = { groups = formatter_groups.web, default = formatters.deno_fmt },
          javascriptreact = { groups = formatter_groups.web, default = formatters.deno_fmt },
          typescriptreact = { groups = formatter_groups.web, default = formatters.deno_fmt },
          json = { groups = formatter_groups.web, default = formatters.deno_fmt },
          jsonc = { groups = formatter_groups.web, default = formatters.deno_fmt },
          markdown = { groups = formatter_groups.web, default = formatters.deno_fmt },
          lua = { groups = formatter_groups.lua },
        },
      }

      local auto_fmt = true

      vim.api.nvim_create_user_command("AutoFmtDisable", function(opts)
        auto_fmt = false
      end, {})

      vim.api.nvim_create_user_command("AutoFmtEnable", function(opts)
        auto_fmt = true
      end, {})

      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        callback = function()
          if auto_fmt then
            require("fmo").format()
          end
        end,
      })
    end,
  },
}
