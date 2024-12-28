return {
  {
    "EL-MASTOR/bufferlist.nvim",
    lazy = true,
    keys = { { "<leader><Tab>", ":BufferList<CR>", desc = "Open bufferlist" } },
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = "BufferList",
    opts = {},
  },
}
