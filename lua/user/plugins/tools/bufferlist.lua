return {
  {
    "EL-MASTOR/bufferlist.nvim",
    lazy = true,
    keys = { { "<leader><Tab>", ":BufferList<CR>", desc = "Open bufferlist" } },
    dependencies = { "echasnovski/mini.icons" },
    cmd = "BufferList",
    opts = {},
  },
}
