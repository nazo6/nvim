-- Select lsp for web development
--
-- 1. If there is a package.json or tsconfig.json in the current directory, use vtsls
-- 2. If there is a deno.json or deno.jsonc in the current directory, use denols
-- 3. If both are present, use the one with nearest root

local cache = {}

return {
  judge = function(bufnr)
    local path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
    if cache[path] == nil then
      local node_root = vim.fs.root(bufnr, { "package.json", "tsconfig.json" })
      local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })

      if node_root and deno_root then
        local _, node_count = string.gsub(node_root, "/", "")
        local _, deno_count = string.gsub(deno_root, "/", "")

        if node_count > deno_count then
          deno_root = nil
        else
          node_root = nil
        end
      end

      if node_root then
        cache[path] = {
          type = "node",
          root = node_root,
        }
      elseif deno_root then
        cache[path] = {
          type = "deno",
          root = deno_root,
        }
      else
        cache[path] = {
          type = "deno",
          root = vim.fs.dirname(path),
        }
      end
    end

    return cache[path]
  end,
}
