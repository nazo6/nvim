local M = {}

local create_setup = require("user.config.lsp.utils").create_setup

local root_pattern = require("lspconfig").util.root_pattern
local function no_formatting(client)
  client.server_capabilities.documentFormattingProvider = false
end

M.mason = {
  tsserver = require "user.config.lsp.configs.tsserver",
  vtsls = require "user.config.lsp.configs.vtsls",
  denols = require "user.config.lsp.configs.denols",
  cssls = create_setup { on_attach = no_formatting },
  html = create_setup { on_attach = no_formatting },
  jsonls = create_setup {
    on_attach = no_formatting,
    filetypes = { "json", "jsonc" },
    settings = { json = { schemas = require("schemastore").json.schemas() } },
  },
  tailwindcss = create_setup {
    root_dir = root_pattern("tailwind.config.js", "tailwind.config.ts", "tailwind.config.cjs"),
  },
  lua_ls = require "user.config.lsp.configs.lua_ls",
  rust_analyzer = require "user.config.lsp.configs.rust_analyzer",
  texlab = require "user.config.lsp.configs.texlab",
  sqls = require "user.config.lsp.configs.sqls",
  fsautocomplete = require "user.config.lsp.configs.fsautocomplete",
  omnisharp = require "user.config.lsp.configs.omnisharp",
  clangd = require "user.config.lsp.configs.clangd",
}

M.manual = {
  satysfi = create_setup {},
}

return M
