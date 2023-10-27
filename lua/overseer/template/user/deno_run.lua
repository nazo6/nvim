return {
  name = "deno run this file",
  builder = function()
    local file = vim.fn.expand "%:p"

    return {
      cmd = { "deno" },
      args = { "run", "-A", file },
      cwd = vim.fn.expand "%:p:h",
    }
  end,
  condition = {
    callback = function()
      local denols = vim.iter(vim.lsp.get_clients { bufnr = 0 }):find(function(c)
        return c.name == "denols"
      end)
      return not not denols
    end,
  },
}
