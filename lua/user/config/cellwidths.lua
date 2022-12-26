require("cellwidths").setup {
  name = "user/custom",
  fallback = function(cw)
    cw.add(0x25cf, 2)
  end,
}
