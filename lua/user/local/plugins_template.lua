-- This file contains plugins that are local to the machine.
-- If you want to use this file, copy it to plugins.lua

return {
  {
    "ActivityWatch/aw-watcher-vim",
    event = { "BufReadPre" },
    config = function()
      vim.cmd [[AWStart]]
    end,
  },
}
