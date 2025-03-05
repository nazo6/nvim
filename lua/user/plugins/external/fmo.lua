return Args.feature.vscode and {}
  or {
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
                deno_fmt_mdx = {
                  command = "deno",
                  args = {
                    "fmt",
                    "-",
                    "--ext",
                    "md",
                  },
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
          deno_fmt_mdx = { type = "conform", name = "deno_fmt_mdx", root_pattern = { "deno.json", "deno.jsonc" } },
          biome = { type = "conform", name = "biome", root_pattern = { "biome.json", "biome.jsonc" } },
          stylua = { type = "conform", name = "stylua", root_pattern = { "stylua.toml" } },
          rust_analyzer = { type = "lsp", name = "rust_analyzer" },
        }

        ---@type table<string, fmo.FormatterSpecifierGroup>
        local formatter_groups = {
          web = {
            {
              specs = {
                { formatters.biome },
                { { type = "lsp", name = "denols" } },
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
                  formatters.stylua,
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
          rust = {
            {
              specs = {
                { { type = "conform", name = "dioxus_fmt", root_pattern = { "Dioxus.toml" } } },
              },
            },
            {
              specs = {
                { formatters.rust_analyzer },
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
            mdx = { groups = {}, default = formatters.deno_fmt_mdx },
            lua = { groups = formatter_groups.lua, default = formatters.stylua },
            rust = { groups = formatter_groups.rust, default = formatters.rust_analyzer },
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
