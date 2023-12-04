local node_or_deno_cache = {}

return {
  node_or_deno = function(type)
    return function(path)
      if node_or_deno_cache[path] == nil then
        local node_root = require("lspconfig").util.root_pattern("package.json", "tsconfig.json")(path)
        local deno_root = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")(path)

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
          node_or_deno_cache[path] = {
            type = "node",
            root = node_root,
          }
        elseif deno_root then
          node_or_deno_cache[path] = {
            type = "deno",
            root = deno_root,
          }
        else
          node_or_deno_cache[path] = {
            type = "deno",
            root = vim.fs.dirname(path),
          }
        end
      end

      if type == "deno" then
        if node_or_deno_cache[path].type == "deno" then
          return node_or_deno_cache[path].root
        end
      else
        if node_or_deno_cache[path].type == "node" then
          return node_or_deno_cache[path].root
        end
      end

      return nil
    end
  end,
}
