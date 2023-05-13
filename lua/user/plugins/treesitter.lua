return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "InsertEnter" },
    cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
    dependencies = {
      { "romgrk/nvim-treesitter-context" },
      { "windwp/nvim-ts-autotag" },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "nvim-treesitter/playground" },
      { "IndianBoy42/tree-sitter-just" },
    },
    config = function()
      require "user.config.treesitter"
    end,
    build = ":TSUpdate",
  },
  {
    "atusy/tsnode-marker.nvim",
    ft = { "markdown", "help" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("tsnode-marker-markdown", {}),
        pattern = { "markdown" },
        callback = function(ctx)
          require("tsnode-marker").set_automark(ctx.buf, {
            target = { "code_fence_content" },
            hl_group = "CursorLine",
          })
        end,
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("tsnode-marker-help", {}),
        pattern = { "help" },
        callback = function(ctx)
          require("tsnode-marker").set_automark(ctx.buf, {
            target = { "code" },
            hl_group = "CursorLine",
          })
        end,
      })
    end,
  },
}
