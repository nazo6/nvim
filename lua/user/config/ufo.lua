return {
  init = function()
    vim.keymap.set("n", "zR", [[<cmd>lua require("ufo").openAllFolds()<CR>]])
    vim.keymap.set("n", "zM", [[<cmd>lua require("ufo").closeAllFolds()<CR>]])
  end,
  config = function()
    require("ufo").setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    }
  end,
}
