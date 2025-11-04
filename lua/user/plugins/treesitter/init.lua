---@diagnostic disable: inject-field
return Args.feature.vscode and {}
  or {
    {
      "nvim-treesitter/nvim-treesitter",
      event = { "FileType", "BufNewFile" },
      build = ":TSUpdate",
      cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
      branch = "main",
      dependencies = {
        {
          "nazo6/ts-query-installer.nvim",
          config = function()
            require("ts-query-installer").setup {
              sources = {
                satysfi = {
                  repo = "https://github.com/monaqa/tree-sitter-satysfi",
                },
                surrealdb = {
                  repo = "https://github.com/DariusCorvus/tree-sitter-surrealdb",
                },
              },
            }
          end,
        },
        { "williamboman/mason.nvim" },
      },
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
          callback = function()
            pcall(vim.treesitter.start)
          end,
        })
      end,
    },
    {
      "atusy/tsnode-marker.nvim",
      ft = { "markdown" },
      init = function()
        vim.api.nvim_create_autocmd("FileType", {
          group = vim.api.nvim_create_augroup("tsnode-marker-markdown", {}),
          pattern = { "markdown" },
          callback = function(ctx)
            require("tsnode-marker").set_automark(ctx.buf, {
              target = { "code_fence_content" },
              hl_group = "CursorLine",
            })
          end,
        })
      end,
    },
    {
      "windwp/nvim-ts-autotag",
      event = { "BufRead" },
      opts = {
        aliases = {
          ["mdx"] = "typescriptreact",
        },
      },
    },
  }
