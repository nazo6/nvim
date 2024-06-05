return {
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    config = function()
      local glance = require "glance"

      glance.setup {
        winbar = {
          enable = false,
        },
      }
    end,
  },
}
