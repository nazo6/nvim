local M = {}

M.executable_cached = {}
M.executable = function(name)
  if M.executable_cached[name] == nil then
    M.executable_cached[name] = vim.fn.executable(name) == 1
  end
  return M.executable_cached[name]
end

-- Get formatters that both ft and conditions match
M.get_active_formatters = function()
  local res = {}
  for _, formatter in ipairs(vim.g.formatter_config) do
    local ft_ok = false;
    for _, ft in ipairs(formatter.filetypes) do
      if ft == vim.bo.filetype then
        ft_ok = true;
        break;
      end
    end
    if ft_ok then
      if formatter.condition() then
          table.insert(res, formatter.name)
      end
    end
  end

  return res;
end

return M;
