---@diagnostic disable: inject-field
return Args.feature.vscode and {}
  or {
    {
      "nazo6/ts-query-installer.nvim",
      config = function()
        require("ts-query-installer").setup {
          sources = {
            satysfi = {
              repo = "https://github.com/monaqa/tree-sitter-satysfi",
            },
            blade = {
              repo = "https://github.com/EmranMR/tree-sitter-blade",
            },
            surrealdb = {
              repo = "https://github.com/DariusCorvus/tree-sitter-surrealdb",
            },
          },
        }
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      event = { "BufRead", "InsertEnter" },
      cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
      dependencies = {
        -- { "romgrk/nvim-treesitter-context" },
        -- { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "nvim-treesitter/playground" },
        { "ts-query-installer.nvim" },

        { "IndianBoy42/tree-sitter-just" },
        { "nushell/tree-sitter-nu" },
      },
      config = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        require("nvim-treesitter.install").compilers = { "clang", "gcc" }
        parser_config.satysfi = {
          install_info = {
            url = "https://github.com/monaqa/tree-sitter-satysfi",
            files = { "src/parser.c", "src/scanner.c" },
          },
          filetype = "satysfi",
        }
        parser_config.blade = {
          install_info = {
            url = "https://github.com/EmranMR/tree-sitter-blade",
            files = { "src/parser.c" },
            branch = "main",
          },
          filetype = "blade",
        }
        parser_config.surrealdb = {
          install_info = {
            url = "https://github.com/DariusCorvus/tree-sitter-surrealdb",
            files = { "src/parser.c" },
            branch = "main",
          },
          filetype = "surrealdb",
        }
        require("tree-sitter-just").setup {}

        local treesitter = require "nvim-treesitter.configs"
        treesitter.setup {
          auto_install = false,
          highlight = { enable = true },
          ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
            "bash",
          },
          -- textobjects = {
          --   select = {
          --     enable = true,
          --     disable = function(lang)
          --       -- TODO: Dart parser is very slow when textojects is enabled.
          --       -- ref: https://github.com/nvim-treesitter/nvim-treesitter/issues/2126
          --       return lang == "dart"
          --     end,
          --     lookahead = true,
          --     keymaps = {
          --       ["af"] = "@function.outer",
          --       ["if"] = "@function.inner",
          --       ["ac"] = "@class.outer",
          --       ["ic"] = "@class.inner",
          --     },
          --   },
          --   move = {
          --     enable = true,
          --     set_jumps = true,
          --     goto_next_start = {
          --       ["]m"] = "@function.outer",
          --       ["]]"] = "@class.outer",
          --     },
          --     goto_next_end = {
          --       ["]M"] = "@function.outer",
          --       ["]["] = "@class.outer",
          --     },
          --     goto_previous_start = {
          --       ["[m"] = "@function.outer",
          --       ["[["] = "@class.outer",
          --     },
          --     goto_previous_end = {
          --       ["[M"] = "@function.outer",
          --       ["[]"] = "@class.outer",
          --     },
          --   },
          -- },
          indent = {
            enable = false,
          },
          playground = {
            enable = true,
            disable = {},
            updatetime = 25,
            persist_queries = false,
            keybindings = {
              toggle_query_editor = "o",
              toggle_hl_groups = "i",
              toggle_injected_languages = "t",
              toggle_anonymous_nodes = "a",
              toggle_language_display = "I",
              focus_language = "f",
              unfocus_language = "F",
              update = "R",
              goto_node = "<cr>",
              show_help = "?",
            },
          },
        }

        -- require("treesitter-context").setup {
        --   enable = true,
        --   throttle = true,
        --   max_lines = 3,
        -- }
      end,
      build = ":TSUpdate",
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
