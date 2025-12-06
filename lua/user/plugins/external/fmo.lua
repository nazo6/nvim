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
        ---@type table<string, fmo.FormatterDef>
        local f = {
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
          biome_check = { type = "conform", name = "biome-check", root_pattern = { "biome.json", "biome.jsonc" } },
          stylua = { type = "conform", name = "stylua", root_pattern = { "stylua.toml" } },
          rust_analyzer = { type = "lsp", name = "rust_analyzer" },
          mdx_analyzer = { type = "lsp", name = "rust_analyzer" },
          dioxus_fmt = { type = "conform", name = "dioxus_fmt", root_pattern = { "Dioxus.toml" } },
          ruff = { type = "conform", name = "ruff_format", root_pattern = { "pyproject.toml" } },
        }

        ---@type fmo.FormatterGroup[]
        local common_web = {
          { f.biome_check },
          {
            { type = "lsp", name = "denols" },
            {
              f.prettierd,
              f.deno_fmt,
            },
            f.biome,
          },
        }
        local web_default = { f.biome, f.biome_check }

        require("fmo").setup {
          fallback_lsp = {
            no_formatter = true,
          },
          filetypes = {
            html = { default = web_default, unpack(common_web) },
            css = { default = web_default, unpack(common_web) },
            javascript = { default = web_default, unpack(common_web) },
            javascriptreact = { default = web_default, unpack(common_web) },
            typescript = { default = web_default, unpack(common_web) },
            typescriptreact = { default = web_default, unpack(common_web) },
            json = { default = web_default, unpack(common_web) },
            jsonc = { default = web_default, unpack(common_web) },
            markdown = { default = f.prettierd, unpack(common_web) },
            mdx = { default = f.prettierd, unpack(common_web) },
            lua = { default = f.stylua },
            python = { default = f.ruff },
            rust = {
              { f.dioxus_fmt },
              { f.rust_analyzer },
            },
            svelte = { default = web_default, unpack(common_web) },
            nu = { default = { f.topiary_nu } },
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
