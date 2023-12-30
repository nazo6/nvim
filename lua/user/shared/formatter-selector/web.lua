-- Select one of "deno", "biome", "prettier", "typescript lsp" as the formatter for a given file.

local M = {
  root = {
    prettier = {
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
    deno_fmt = { "deno.json", "deno.jsonc" },
    biome = { "biome.json" },
  },
  supported = {
    biome = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "json",
      "jsonc",
    },
  },
}

local cache = {}

local root_pattern = function(pattern)
  local search = require("lspconfig").util.root_pattern(unpack(pattern))
  ---@return { [1]: string | nil, [2]: number | nil}[]
  return function(path)
    local root = search(path)
    if root ~= nil then
      local _, node_count = string.gsub(root, "/", "")
      return { root, node_count }
    else
      return { nil, nil }
    end
  end
end

local function judge_inner(path, bufnr)
  local prettier_root_match = root_pattern(M.root.prettier)
  local deno_root_search = root_pattern(M.root.deno_fmt)
  local biome_root_search = root_pattern(M.root.biome)

  local prettier_root = prettier_root_match(path)
  local deno_root = deno_root_search(path)
  local biome_root = biome_root_search(path)
  local best_match = vim
    .iter({
      prettier = prettier_root,
      biome = biome_root,
      deno_fmt = deno_root,
    })
    :filter(function(_, v)
      return v[1] ~= nil
    end)
    :fold({ nil, nil, 10000 }, function(acc, k, v)
      if v[2] < acc[3] then
        return { k, v[1], v[2] }
      else
        return acc
      end
    end)

  if best_match[1] ~= nil then
    cache[bufnr] = {
      type = best_match[1],
      root = best_match[2],
    }
  else
    cache[bufnr] = {
      type = "deno_fmt",
      root = vim.fs.dirname(path),
    }
  end
end

M.judge = function(path, bufnr)
  local lsp = vim.iter(vim.lsp.get_clients { bufnr = bufnr }):find(function(c)
    return c.name == "denols" or c.name == "biome"
  end)
  if lsp then
    cache[bufnr] = {
      type = nil,
      root = nil,
    }
  end

  if cache[bufnr] == nil then
    judge_inner(path, bufnr)
  end

  return cache[bufnr]
end

return M
