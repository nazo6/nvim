local utils = require"user.plugins.external.formatter.utils"

local stylua = {
  name = "stylua",
  formatter = require("formatter.filetypes.lua").stylua,
  condition = function()
    return vim.fn.executable("stylua") == 1
  end,
  filetypes = { "lua" }
}

local prettierd_pat = require"lspconfig.util".root_pattern(".prettierrc", ".prettierrc.js", ".prettierrc.cjs")
local prettierd = {
  name = "prettierd",
  formatter = require "formatter.defaults.prettierd",
  condition = function()
    return (utils.executable("prettierd") and prettierd_pat(vim.fn.expand('%')) ~= nil)
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "markdown",
    "typescript",
    "typescriptreact",
  },
}

local denofmt_ignore_pat = require"lspconfig.util".root_pattern("deno.json", "deno.jsonc")
local denofmt = {
  name = "denofmt",
  formatter = require "formatter.defaults.denofmt",
  condition = function()
    if prettierd.condition() then
      return false
    elseif utils.executable("deno") and not(denofmt_ignore_pat(vim.fn.expand('%'))) then
      return true
    else
      return false
    end
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "markdown",
    "typescript",
    "typescriptreact",
  },
}

return {
  stylua, prettierd, denofmt
}
