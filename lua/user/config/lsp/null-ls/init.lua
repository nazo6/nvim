local null_ls = require "null-ls"

-- prettier:0, deno_ls:1, deno_fmt:2
local buf_web_format_type = {}

local function check_web_format_type(bufnr, path)
  if buf_web_format_type[bufnr] ~= nil then
    return buf_web_format_type[bufnr]
  end

  if require("null-ls.utils").root_pattern(".prettierrc", ".prettierrc.js", ".prettierrc.cjs")(path) then
    buf_web_format_type[bufnr] = 0
    return 0
  end

  if require("null-ls.utils").root_pattern("deno.json", "deno.jsonc")(path) then
    buf_web_format_type[bufnr] = 1
    return 1
  end

  return 2
end

local nu_ls = require "nu-ls"
-- nu_ls.condition = function()
--   return vim.fn.executable "nu" == 1
-- end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.deno_fmt.with {
      runtime_condition = function(params)
        return check_web_format_type(params.bufnr, params.bufname) == 2
      end,
      condition = function()
        return vim.fn.executable "deno" == 1
      end,
    },
    null_ls.builtins.formatting.prettierd.with {
      runtime_condition = function(params)
        return check_web_format_type(params.bufnr, params.bufname) == 0
      end,
      extra_filetypes = { "svelte" },
    },
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.sqlfluff,
    nu_ls,
  },
  default_timeout = 10000,
}

null_ls.register(require "user.config.lsp.null-ls.satysfi-fmt")
