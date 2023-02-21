return {
  require = function(mod)
    return require("user.config.heirline." .. mod)
  end,
}
