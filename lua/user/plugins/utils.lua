return function(use)
  -----------------------
  -- Window management --
  -----------------------
  use("tkmpypy/chowcho.nvim", {
    on_lua = "chowcho",
    lua_add = [[require("user.config.chowcho").setup()]],
    lua_source = [[require("user.config.chowcho").config()]],
  })
  use("mrjones2014/smart-splits.nvim", {
    on_lua = "smart-splits",
    lua_add = [[require("user.config.smart-splits").setup()]],
    lua_source = [[require("user.config.smart-splits").config()]],
  })

  -----------
  -- Tools --
  -----------
  use("sbulav/nredir.nvim", { on_cmd = { "Nredir" } })
  use("dstein64/vim-startuptime", { on_cmd = { "StartupTime" } })
  use("nanotee/zoxide.vim", {
    on_cmd = { "Z" },
  })
end
