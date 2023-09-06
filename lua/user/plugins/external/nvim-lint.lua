return {
  "mfussenegger/nvim-lint",
  event = { "BufRead", "BufWritePost" },
  config = function()
    require("lint").linters_by_ft = {
      sql = { "sqlfluff" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
