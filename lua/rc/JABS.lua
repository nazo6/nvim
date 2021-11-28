return {
  keymaps = function()
    nnoremap("<Tab>", "<cmd>JABSOpen<CR>", "silent")
  end,
  setup = function()
    local ui = vim.api.nvim_list_uis()[1]
    require("jabs").setup {
      position = "corner",
      width = 50,
      height = 10,
      border = "shadow",
      preview_position = "left",
      preview = {
        width = 40,
        height = 30,
        border = "double",
      },
      col = ui.width,
      row = ui.height / 2,
    }
  end,
}
