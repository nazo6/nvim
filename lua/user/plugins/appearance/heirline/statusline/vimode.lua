local separators = require("user.plugins.appearance.heirline.utils").separators

return {
  provider = separators.block,
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = self.mode_colors[mode] }
  end,
  init = function(self)
    self.mode = vim.fn.mode(1)
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*o",
        command = "redrawstatus",
      })
      self.once = true
    end
  end,
  static = {
    mode_colors = {
      n = "red",
      i = "green",
      v = "cyan",
      V = "cyan",
      ["\22"] = "cyan",
      c = "orange",
      s = "purple",
      S = "purple",
      ["\19"] = "purple",
      R = "orange",
      r = "orange",
      ["!"] = "red",
      t = "red",
    },
  },
  update = {
    "ModeChanged",
  },
}
