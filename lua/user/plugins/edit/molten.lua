return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    ft = { "markdown" },
    dependencies = {
      {
        "willothy/wezterm.nvim",
        config = true,
      },
      {
        "GCBallesteros/jupytext.nvim",
        config = true,
        opts = {
          style = "markdown",
          output_extension = "md",
          force_ft = "markdown",
        },
      },
    },
    init = function()
      vim.g.python3_host_prog = vim.fn.expand "~/.virtualenvs/neovim/bin/python3"
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_auto_open_output = false
    end,
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lspFeatures = {
        chunks = "all",
      },
      codeRunner = {
        default_method = "molten",
      },
    },
  },
}
