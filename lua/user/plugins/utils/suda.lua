return {
  "lambdalisue/suda.vim",
  event = { "BufReadPre" },
  init = function()
    vim.g.suda_smart_edit = 1
  end,
}
