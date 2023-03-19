require("user.config.git").init()

return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "BufRead",
    cmd = "GitSigns",
    config = function()
      require("user.config.git").config.gitsigns()
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = function()
      require("user.config.git").config.diffview()
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
      "Gvdiffsplit",
      "Gvsplit",
      "Gtabedit",
      "Gsplit",
      "Gvedit",
      "Gwrite",
      "Gw",
    },
  },
}
