local schemas = require("data.catalog").schemas
local root_pattern = require("lspconfig").util.root_pattern

local function noFormatting(client)
	client.resolved_capabilities.document_formatting = false
end

return {
	denols = {
		root_dir = root_pattern(".nvim-lsp-denols"),
	},
	cssls = { on_attach = noFormatting },
	html = { on_attach = noFormatting },
	jsonls = { filetypes = { "json", "jsonc" }, settings = { json = { schemas = schemas } } },
	typescript = {
		root_dir = root_pattern("package.json", "tsconfig.json"),
		on_attach = noFormatting,
	},
	tailwindcss = {
		root_dir = root_pattern("tailwind.config.js", "tailwind.config.ts"),
	},
  lua = require("lua-dev").setup(
{
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  -- pass any additional options that will be merged in the final lsp config
  lspconfig = {
    -- cmd = {"lua-language-server"},
    -- on_attach = ...
  },
}
  ),
	diagnosticls = {
		filetypes = {
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"typescript",
			"typescript.tsx",
			"typescriptreact",
      "lua"
		},
		root_dir = root_pattern(".git", "package.json", "tsconfig.json"),
		init_options = {
			filetypes = {
				javascript = "eslint",
				javascriptreact = "eslint",
				typescript = "eslint",
				typescriptreact = "eslint",
				["typescript.tsx"] = "eslint",
			},
			formatFiletypes = {
				javascript = "prettier",
				javascriptreact = "prettier",
				json = "prettier",
				jsonc = "prettier",
				typescript = "prettier",
				typescriptreact = "prettier",
				["typescript.tsx"] = "prettier",
        lua = "luaformat"
			},
			linters = {
				eslint = {
					command = "eslint_d",
					rootPatterns = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.yml" },
					debounce = 100,
					args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
					sourceName = "eslint",
					parseJson = {
						errorsRoot = "[0].messages",
						line = "line",
						column = "column",
						endLine = "endLine",
						endColumn = "endColumn",
						message = "[eslint] ${message} [${ruleId}]",
						security = "severity",
					},
					securities = { "info", "warning", "error" },
				},
			},
			formatters = {
				prettier = {
					command = "prettier",
					args = { "--stdin-filepath", "%filepath" },
					rootPatterns = { ".prettierrc", ".prettierrc.js", "prettierrc.yml" },
				},
        luaformat = {
          command = "lua-format",
          args = {"-i"},
        }
			},
		},
	},
}
