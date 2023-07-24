return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "zioroboco/nu-ls.nvim",
      cond = function()
        -- seems not working on windows
        return not require("user.utils").is_win
      end,
    },
  },
}
