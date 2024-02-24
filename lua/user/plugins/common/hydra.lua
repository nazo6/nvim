local hydras = {
  require "user.plugins.common.hydra.venn",
  -- require "user.plugins.common.hydra.windows",
}

local keys = {}
for _, hydra in ipairs(hydras) do
  table.insert(keys, hydra.key)
end

vim.print(keys)

return {
  "nvimtools/hydra.nvim",
  keys = keys,
  config = function()
    for _, hydra in ipairs(hydras) do
      hydra.setup()
    end
  end,
}
