local schemas = require('data.catalog').schemas
local root_pattern = require('lspconfig').util.root_pattern

local function noFormatting(client)
  client.resolved_capabilities.document_formatting = false
end

vim.lsp.set_log_level 'info'
return {
  denols = {
    root_dir = root_pattern '.nvim-lsp-denols',
  },
  cssls = { on_attach = noFormatting },
  html = { on_attach = noFormatting },
  jsonls = { filetypes = { 'json', 'jsonc' }, settings = { json = { schemas = schemas } } },
  typescript = {
    root_dir = root_pattern('package.json', 'tsconfig.json'),
    on_attach = noFormatting,
  },
  tailwindcss = {
    root_dir = root_pattern('tailwind.config.js', 'tailwind.config.ts'),
  },
  lua = require('lua-dev').setup {
    library = {
      vimruntime = true, -- runtime path
      types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
      plugins = true, -- installed opt or start plugins in packpath
      -- you can also specify the list of plugins to make available as a workspace library
      -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    },
    -- pass any additional options that will be merged in the final lsp config
    lspconfig = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    },
  },
}
