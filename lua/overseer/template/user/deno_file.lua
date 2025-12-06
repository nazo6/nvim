local function is_deno_project()
  local denols = vim.iter(vim.lsp.get_clients { bufnr = 0 }):find(function(c)
    return c.name == "denols"
  end)
  return not not denols
end

---@type overseer.TemplateFileProvider
return {
  generator = function()
    if not is_deno_project() then
      return {}
    end

    local file = vim.fn.expand "%:p"

    return {
      {
        cmd = { "deno" },
        args = { "run", "-A", file },
        cwd = vim.fn.expand "%:p:h",
      },
      {
        cmd = { "deno" },
        args = { "test", "-A", file },
        cwd = vim.fn.expand "%:p:h",
      },
    }
  end,
}
