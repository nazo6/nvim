local null_ls = require "null-ls"

local function check_web_format_type(params)
  if params.root_has_file(".prettierrc", ".prettierrc.js", ".prettierrc.cjs") then
    return 0
  end

  if params.root_has_file("deno.json", "deno.jsonc") then
    return 1
  end

  return 2
end

local sources = {
  null_ls.builtins.formatting.deno_fmt.with {
    condition = function(params)
      return vim.fn.executable "deno" == 1 and (check_web_format_type(params) == 2)
    end,
  },
  null_ls.builtins.formatting.prettierd.with {
    condition = function(params)
      return check_web_format_type(params) == 0
    end,
    extra_filetypes = { "svelte" },
  },
  null_ls.builtins.formatting.stylua,
}

local success, nu_ls = pcall(require, "nu-ls")
if success then
  table.insert(sources, nu_ls)
end

null_ls.setup {
  sources = sources,
  default_timeout = 10000,
}

null_ls.register(require "user.config.lsp.null-ls.satysfi-fmt")
