local M = {}

local create_setup = require("user.config.lsp.config.utils").create_setup

local root_pattern = require("lspconfig").util.root_pattern
local function no_formatting(client)
  client.server_capabilities.documentFormattingProvider = false
end

M.mason = {
  tsserver = require "user.config.lsp.config.servers.tsserver",
  vtsls = require "user.config.lsp.config.servers.vtsls",
  denols = require "user.config.lsp.config.servers.denols",
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
  lua_ls = require "user.config.lsp.config.servers.lua_ls",
  rust_analyzer = require "user.config.lsp.config.servers.rust_analyzer",
  texlab = require "user.config.lsp.config.servers.texlab",
  sqls = require "user.config.lsp.config.servers.sqls",
  fsautocomplete = require "user.config.lsp.config.servers.fsautocomplete",
  omnisharp = require "user.config.lsp.config.servers.omnisharp",
  clangd = require "user.config.lsp.config.servers.clangd",
  satysfi = create_setup {},
}

return M
