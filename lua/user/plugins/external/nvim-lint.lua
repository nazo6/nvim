return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost" },
  config = function()
    require("lint").linters_by_ft = {
      sql = vim.fn.executable "sqlfluff" == 1 and { "sqlfluff" } or {},
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
